#!/bin/bash

# 🚀 SEO FIX DEPLOYMENT SCRIPT
# Run this after reviewing SEO_AUDIT_REPORT.md

echo "🔍 FastShortcuts SEO Fix Deployment"
echo "===================================="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Step 1: Verify files changed
echo "📋 Step 1: Verifying modified files..."
if [ -f "robots.txt" ] && [ -f "sitemap.xml" ] && [ -f ".htaccess" ]; then
    echo -e "${GREEN}✓ All critical files present${NC}"
else
    echo -e "${RED}✗ Missing critical files!${NC}"
    exit 1
fi

# Step 2: Show what changed
echo ""
echo "📝 Step 2: Files modified for SEO:"
echo "   • robots.txt - Added backup/archive blocks"
echo "   • sitemap.xml - Removed empty directories"
echo "   • .htaccess - Added backup folder blocks"
echo ""

# Step 3: Git status
echo "🔍 Step 3: Git status..."
git status --short

# Step 4: Prompt for commit
echo ""
read -p "Ready to commit SEO fixes? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git add robots.txt sitemap.xml .htaccess SEO_AUDIT_REPORT.md
    git commit -m "🔧 SEO FIX: Block duplicate content, clean sitemap, update robots.txt"
    echo -e "${GREEN}✓ Changes committed${NC}"
else
    echo -e "${YELLOW}⚠ Commit skipped${NC}"
    exit 0
fi

# Step 5: Push to production
echo ""
read -p "Push to production? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git push origin main
    echo -e "${GREEN}✓ Pushed to production${NC}"
else
    echo -e "${YELLOW}⚠ Push skipped${NC}"
    exit 0
fi

# Step 6: Verification
echo ""
echo "🎉 Deployment Complete!"
echo ""
echo "📋 NEXT STEPS (Do within 24 hours):"
echo "=================================="
echo ""
echo "1. Verify deployment:"
echo "   curl https://fastshortcuts.com/robots.txt"
echo "   curl https://fastshortcuts.com/sitemap.xml"
echo ""
echo "2. Google Search Console:"
echo "   • Submit updated sitemap"
echo "   • Request re-indexing of top pages"
echo "   • Check for crawl errors"
echo ""
echo "3. Monitor results (7-14 days):"
echo "   • Check GSC Performance tab"
echo "   • Look for indexing improvements"
echo "   • Track organic traffic growth"
echo ""
echo "4. Optional cleanup:"
echo "   rm -rf backup_20251213_111845/"
echo ""
echo -e "${GREEN}✅ See SEO_AUDIT_REPORT.md for full details${NC}"
