#!/bin/bash

# FastShortcuts Project Restructure Script
# This script safely reorganizes the project structure
# Created: December 13, 2025

set -e  # Exit on error

echo "🚀 FastShortcuts Project Restructure"
echo "===================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"

echo -e "${BLUE}Project root: ${PROJECT_ROOT}${NC}"
echo ""

# Ask for confirmation
read -p "⚠️  This will reorganize your project structure. Continue? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}Aborted.${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}Creating backup...${NC}"

# Create a backup
BACKUP_DIR="${PROJECT_ROOT}/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
cp -R "$PROJECT_ROOT"/* "$BACKUP_DIR/" 2>/dev/null || true
echo -e "${GREEN}✓ Backup created at: ${BACKUP_DIR}${NC}"

echo ""
echo -e "${YELLOW}Creating new directory structure...${NC}"

# Create new directories
mkdir -p "${PROJECT_ROOT}/assets/css"
mkdir -p "${PROJECT_ROOT}/assets/js"
mkdir -p "${PROJECT_ROOT}/assets/icons"
mkdir -p "${PROJECT_ROOT}/pages"
mkdir -p "${PROJECT_ROOT}/docs/setup"
mkdir -p "${PROJECT_ROOT}/docs/seo"
mkdir -p "${PROJECT_ROOT}/docs/design"
mkdir -p "${PROJECT_ROOT}/docs/updates"
mkdir -p "${PROJECT_ROOT}/scripts"
mkdir -p "${PROJECT_ROOT}/archive"

echo -e "${GREEN}✓ Directory structure created${NC}"

echo ""
echo -e "${YELLOW}Moving CSS files...${NC}"
[ -f "styles.css" ] && mv "styles.css" "assets/css/" && echo "  ✓ styles.css"
[ -f "styles-new.css" ] && mv "styles-new.css" "archive/" && echo "  ✓ styles-new.css → archive"

echo ""
echo -e "${YELLOW}Moving JavaScript files...${NC}"
[ -f "script.js" ] && mv "script.js" "assets/js/" && echo "  ✓ script.js"
[ -f "script-new.js" ] && mv "script-new.js" "archive/" && echo "  ✓ script-new.js → archive"

echo ""
echo -e "${YELLOW}Moving icon files...${NC}"
if [ -d "icons" ]; then
    mv icons/* "assets/icons/" 2>/dev/null && echo "  ✓ All icons moved"
    rmdir icons
fi

echo ""
echo -e "${YELLOW}Moving static pages...${NC}"
for page in about.html contact.html privacy.html terms.html comparison.html 404.html; do
    [ -f "$page" ] && mv "$page" "pages/" && echo "  ✓ $page"
done

echo ""
echo -e "${YELLOW}Moving backup/old files to archive...${NC}"
for file in index-old.html index-new.html *.html.bak; do
    [ -f "$file" ] && mv "$file" "archive/" 2>/dev/null && echo "  ✓ $file"
done

echo ""
echo -e "${YELLOW}Moving documentation files...${NC}"

# Setup docs
for doc in DEPLOYMENT_CHECKLIST.md PRE_DEPLOYMENT_CHECKLIST.md WEBMASTER_SUBMISSION_CHECKLIST.md FINAL_LAUNCH_CHECKLIST.md; do
    [ -f "$doc" ] && mv "$doc" "docs/setup/" && echo "  ✓ $doc → docs/setup/"
done

# SEO docs
for doc in SEO_*.md SCHEMA_*.md LINK_AUDIT*.md PHOTOSHOP_SEO_ANALYSIS.md; do
    [ -f "$doc" ] && mv "$doc" "docs/seo/" 2>/dev/null && echo "  ✓ $doc → docs/seo/"
done

# Design docs
for doc in DESIGN_*.md REDESIGN_*.md SVG_ICONS_*.md ICONS_QUICKSTART.md FAVICON_*.md MOBILE_*.md FOOTER_*.md; do
    [ -f "$doc" ] && mv "$doc" "docs/design/" 2>/dev/null && echo "  ✓ $doc → docs/design/"
done

# Update docs
for doc in CONTENT_UPDATES*.md FINAL_UPDATES*.md UPDATES_*.md FINAL_SITE_STATUS.md ESSENTIAL_PAGES*.md NAVIGATION_FIX*.md PHOTOSHOP_PAGE*.md SUBMISSION_FILES*.md GOOGLE_ANALYTICS*.md; do
    [ -f "$doc" ] && mv "$doc" "docs/updates/" 2>/dev/null && echo "  ✓ $doc → docs/updates/"
done

# Move TROUBLESHOOTING to docs root
[ -f "TROUBLESHOOTING.md" ] && mv "TROUBLESHOOTING.md" "docs/" && echo "  ✓ TROUBLESHOOTING.md → docs/"

echo ""
echo -e "${YELLOW}Moving shell scripts...${NC}"
for script in *.sh; do
    if [ "$script" != "restructure.sh" ] && [ -f "$script" ]; then
        mv "$script" "scripts/" && echo "  ✓ $script"
    fi
done

echo ""
echo -e "${YELLOW}Moving miscellaneous files to archive...${NC}"
for file in favicon-base64.txt icon-preview.html create-favicon.html; do
    [ -f "$file" ] && mv "$file" "archive/" 2>/dev/null && echo "  ✓ $file"
done

echo ""
echo -e "${GREEN}✓ File reorganization complete!${NC}"

echo ""
echo -e "${YELLOW}Now updating file paths in HTML files...${NC}"

# Update paths in root HTML files (index.html)
if [ -f "index.html" ]; then
    echo "  Updating index.html..."
    # Update CSS path
    sed -i.bak 's|href="styles\.css"|href="assets/css/styles.css"|g' "index.html"
    # Update JS path
    sed -i.bak 's|src="script\.js"|src="assets/js/script.js"|g' "index.html"
    # Update icon paths
    sed -i.bak 's|src="icons/|src="assets/icons/|g' "index.html"
    # Update page links
    sed -i.bak 's|href="about\.html"|href="pages/about.html"|g' "index.html"
    sed -i.bak 's|href="contact\.html"|href="pages/contact.html"|g' "index.html"
    sed -i.bak 's|href="privacy\.html"|href="pages/privacy.html"|g' "index.html"
    sed -i.bak 's|href="terms\.html"|href="pages/terms.html"|g' "index.html"
    sed -i.bak 's|href="comparison\.html"|href="pages/comparison.html"|g' "index.html"
    rm "index.html.bak"
    echo "  ✓ index.html updated"
fi

# Update paths in shortcuts HTML files
echo "  Updating shortcuts pages..."
for shortcut_dir in shortcuts/*/; do
    if [ -f "${shortcut_dir}index.html" ]; then
        shortcut_name=$(basename "$shortcut_dir")
        echo "    - $shortcut_name"
        # Update CSS path
        sed -i.bak 's|href="../../styles\.css"|href="../../assets/css/styles.css"|g' "${shortcut_dir}index.html"
        # Update JS path
        sed -i.bak 's|src="../../script\.js"|src="../../assets/js/script.js"|g' "${shortcut_dir}index.html"
        # Update icon paths
        sed -i.bak 's|src="../../icons/|src="../../assets/icons/|g' "${shortcut_dir}index.html"
        # Update page links
        sed -i.bak 's|href="../../about"|href="../../pages/about.html"|g' "${shortcut_dir}index.html"
        sed -i.bak 's|href="../../contact"|href="../../pages/contact.html"|g' "${shortcut_dir}index.html"
        sed -i.bak 's|href="../../privacy"|href="../../pages/privacy.html"|g' "${shortcut_dir}index.html"
        sed -i.bak 's|href="../../terms"|href="../../pages/terms.html"|g' "${shortcut_dir}index.html"
        rm "${shortcut_dir}index.html.bak"
    fi
done

# Update paths in pages HTML files
echo "  Updating pages..."
for page in pages/*.html; do
    if [ -f "$page" ]; then
        page_name=$(basename "$page")
        echo "    - $page_name"
        # Update CSS path
        sed -i.bak 's|href="styles\.css"|href="../assets/css/styles.css"|g' "$page"
        # Update JS path
        sed -i.bak 's|src="script\.js"|src="../assets/js/script.js"|g' "$page"
        # Update icon paths
        sed -i.bak 's|src="icons/|src="../assets/icons/|g' "$page"
        # Update navigation to home
        sed -i.bak 's|href="index\.html"|href="../index.html"|g' "$page"
        # Update navigation to other pages
        sed -i.bak 's|href="about\.html"|href="about.html"|g' "$page"
        sed -i.bak 's|href="contact\.html"|href="contact.html"|g' "$page"
        sed -i.bak 's|href="privacy\.html"|href="privacy.html"|g' "$page"
        sed -i.bak 's|href="terms\.html"|href="terms.html"|g' "$page"
        # Update shortcut links
        sed -i.bak 's|href="shortcuts/|href="../shortcuts/|g' "$page"
        rm "$page.bak"
    fi
done

echo ""
echo -e "${GREEN}✓ All paths updated!${NC}"

echo ""
echo -e "${BLUE}📊 Final structure:${NC}"
tree -L 2 -I 'backup_*' --dirsfirst 2>/dev/null || ls -la

echo ""
echo -e "${GREEN}✅ Restructure complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Review the changes"
echo "2. Test the website locally"
echo "3. If everything works, delete the backup folder"
echo "4. If there are issues, restore from: ${BACKUP_DIR}"
echo ""
echo "To test locally, run:"
echo "  cd ${PROJECT_ROOT}"
echo "  python3 -m http.server 8000"
echo "  # Then open http://localhost:8000 in your browser"
echo ""
