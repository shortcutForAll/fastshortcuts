"""Validate a shortcut page: JSON-LD blocks, FAQ parity, assets, internal links."""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def check(page_rel: str) -> list[str]:
    page = ROOT / page_rel
    html = page.read_text(encoding="utf-8")
    errors = []

    blocks = []
    for i, raw in enumerate(re.findall(
            r'<script type="application/ld\+json">(.*?)</script>', html, re.S), 1):
        try:
            blocks.append(json.loads(raw))
        except json.JSONDecodeError as exc:
            errors.append(f"{page.name}: JSON-LD block {i} invalid: {exc}")

    print("JSON-LD blocks:", [b.get("@type") for b in blocks])
    rows = html.count('class="shortcut-item"')
    groups = html.count('class="group-title"')
    print("shortcut rows:", rows)
    print("groups:", groups)

    faq_html = html.count("<details")
    faq_schema = sum(len(b["mainEntity"]) for b in blocks if b.get("@type") == "FAQPage")
    print(f"FAQ: {faq_html} on page, {faq_schema} in schema")
    if faq_html != faq_schema:
        errors.append(f"FAQ mismatch: {faq_html} on page vs {faq_schema} in schema")

    # local hrefs/srcs resolve to real files
    for attr, url in re.findall(r'(href|src)="([^"#]+)"', html):
        if url.startswith(("http", "mailto:", "//", "data:")):
            continue
        base = ROOT if url.startswith("/") else page.parent
        target = (base / url.lstrip("/")).resolve()
        if target.is_dir():
            target = target / "index.html"
        if not target.exists():
            errors.append(f"broken {attr}: {url}")
    return errors


if __name__ == "__main__":
    all_errors = []
    for rel in sys.argv[1:]:
        print(f"--- {rel} ---")
        all_errors += check(rel)
    if all_errors:
        print("\nERRORS:")
        for e in all_errors:
            print(" -", e)
        sys.exit(1)
    print("\nAll checks passed.")
