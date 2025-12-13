#!/bin/bash

echo "🔍 Checking FastShortcuts.com for broken links..."
echo "================================================"
echo ""

SITE="https://fastshortcuts.com"
FAIL_COUNT=0

check_url() {
    local url=$1
    local name=$2
    
    status=$(curl -o /dev/null -s -w "%{http_code}" -L "$url")
    
    if [ "$status" = "200" ]; then
        echo "✅ $name - $url"
    else
        echo "❌ $name - $url (Status: $status)"
        ((FAIL_COUNT++))
    fi
}

echo "📄 Main Pages:"
check_url "$SITE/" "Homepage"
check_url "$SITE/about" "About (clean URL)"
check_url "$SITE/contact" "Contact (clean URL)"
check_url "$SITE/privacy" "Privacy (clean URL)"
check_url "$SITE/terms" "Terms (clean URL)"

echo ""
echo "🔧 Shortcut Pages:"
check_url "$SITE/shortcuts/vscode/" "VS Code"
check_url "$SITE/shortcuts/windows/" "Windows"
check_url "$SITE/shortcuts/mac/" "Mac"
check_url "$SITE/shortcuts/intellij/" "IntelliJ"
check_url "$SITE/shortcuts/chrome/" "Chrome"
check_url "$SITE/shortcuts/sublime/" "Sublime"

echo ""
echo "🔀 Redirects (Old .html URLs):"
check_url "$SITE/about.html" "about.html redirect"
check_url "$SITE/contact.html" "contact.html redirect"
check_url "$SITE/privacy.html" "privacy.html redirect"
check_url "$SITE/terms.html" "terms.html redirect"

echo ""
echo "📋 SEO Files:"
check_url "$SITE/sitemap.xml" "Sitemap"
check_url "$SITE/robots.txt" "Robots.txt"

echo ""
echo "🧪 Error Pages:"
check_url "$SITE/this-page-does-not-exist-test" "404 Page"

echo ""
echo "================================================"
if [ $FAIL_COUNT -eq 0 ]; then
    echo "✅ All links working! Site is healthy."
else
    echo "⚠️  Found $FAIL_COUNT broken link(s)"
fi
