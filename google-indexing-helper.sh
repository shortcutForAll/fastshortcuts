#!/bin/bash

# Google Indexing Quick Fix Script
# Run this after setting up Google Search Console

echo "🚀 FastShortcuts - Google Indexing Setup"
echo "=========================================="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}This script will help you get indexed by Google${NC}"
echo ""

# Step 1: Check current indexing status
echo "📊 Step 1: Check Current Indexing Status"
echo "----------------------------------------"
echo "Opening Google search to check if your site is indexed..."
echo ""
echo "Search query: site:fastshortcuts.com"
echo ""
echo -e "${YELLOW}Action Required:${NC} Look at the search results."
echo "   - If you see 0 results → Site is NOT indexed (continue below)"
echo "   - If you see results → Some pages are indexed (good!)"
echo ""
read -p "Press Enter to open Google search..." 
open "https://www.google.com/search?q=site:fastshortcuts.com" 2>/dev/null || \
xdg-open "https://www.google.com/search?q=site:fastshortcuts.com" 2>/dev/null || \
echo "Please manually visit: https://www.google.com/search?q=site:fastshortcuts.com"
echo ""
sleep 2

# Step 2: Google Search Console Setup
echo "🔧 Step 2: Google Search Console Setup"
echo "----------------------------------------"
echo -e "${YELLOW}Action Required:${NC} Set up Google Search Console"
echo ""
echo "1. Click the link below (or visit manually)"
echo "2. Choose 'URL prefix' property type"
echo "3. Enter: https://fastshortcuts.com"
echo "4. Choose 'HTML tag' verification method"
echo "5. Copy the meta tag code"
echo "6. Add it to index.html <head> section"
echo ""
read -p "Press Enter to open Google Search Console..." 
open "https://search.google.com/search-console/welcome" 2>/dev/null || \
xdg-open "https://search.google.com/search-console/welcome" 2>/dev/null || \
echo "Please manually visit: https://search.google.com/search-console/welcome"
echo ""
sleep 2

# Step 3: Provide verification code location
echo "📝 Step 3: Add Verification Code"
echo "----------------------------------------"
echo "After getting your verification code from Google:"
echo ""
echo -e "${GREEN}1. Open:${NC} index.html"
echo -e "${GREEN}2. Find:${NC} <!-- TODO: Replace with your actual verification code -->"
echo -e "${GREEN}3. Replace with:${NC} <meta name=\"google-site-verification\" content=\"YOUR_CODE\" />"
echo -e "${GREEN}4. Save the file${NC}"
echo -e "${GREEN}5. Deploy to your server${NC}"
echo -e "${GREEN}6. Click 'Verify' in Google Search Console${NC}"
echo ""
read -p "Press Enter when you've added the verification code..."
echo ""

# Step 4: Submit Sitemap
echo "🗺️  Step 4: Submit Sitemap"
echo "----------------------------------------"
echo "Once verified in Google Search Console:"
echo ""
echo "1. Click 'Sitemaps' in the left menu"
echo "2. Enter: sitemap.xml"
echo "3. Click 'Submit'"
echo "4. Wait for 'Success' status"
echo ""
echo -e "${GREEN}Your sitemap URL:${NC} https://fastshortcuts.com/sitemap.xml"
echo ""
read -p "Press Enter to continue..."
echo ""

# Step 5: Request Indexing
echo "🔍 Step 5: Request Indexing for Key Pages"
echo "----------------------------------------"
echo "In Google Search Console, use URL Inspection tool:"
echo ""
echo -e "${GREEN}Priority pages to request indexing:${NC}"
echo "   1. https://fastshortcuts.com"
echo "   2. https://fastshortcuts.com/shortcuts/vscode/"
echo "   3. https://fastshortcuts.com/shortcuts/chrome/"
echo "   4. https://fastshortcuts.com/shortcuts/windows/"
echo "   5. https://fastshortcuts.com/shortcuts/mac/"
echo ""
echo "For each URL:"
echo "   - Paste URL in URL Inspection"
echo "   - Click 'Test Live URL'"
echo "   - Click 'Request Indexing'"
echo ""
read -p "Press Enter to continue..."
echo ""

# Step 6: Build Backlinks
echo "🔗 Step 6: Build Initial Backlinks"
echo "----------------------------------------"
echo "To speed up discovery, share your site:"
echo ""
echo -e "${GREEN}Quick wins (do today):${NC}"
echo "   ☐ Reddit: r/webdev, r/programming"
echo "   ☐ Hacker News: Show HN post"
echo "   ☐ Product Hunt launch"
echo "   ☐ Twitter/X announcement"
echo "   ☐ LinkedIn post"
echo "   ☐ Dev.to article"
echo "   ☐ GitHub profile README"
echo ""
read -p "Press Enter to see sharing links..."
echo ""

# Open sharing platforms
echo "Opening sharing platforms..."
echo ""
echo "1. Reddit - Web Dev"
open "https://reddit.com/r/webdev/submit" 2>/dev/null || echo "   Visit: https://reddit.com/r/webdev/submit"
sleep 1

echo "2. Product Hunt"
open "https://www.producthunt.com/posts/new" 2>/dev/null || echo "   Visit: https://www.producthunt.com/posts/new"
sleep 1

echo "3. Hacker News"
open "https://news.ycombinator.com/submit" 2>/dev/null || echo "   Visit: https://news.ycombinator.com/submit"
sleep 1

echo ""
echo "=========================================="
echo "✅ Setup Complete!"
echo "=========================================="
echo ""
echo -e "${GREEN}What happens next:${NC}"
echo "   • Google will crawl your site in 1-2 days"
echo "   • First pages indexed in 2-7 days"
echo "   • Full site indexed in 1-4 weeks"
echo "   • Rankings appear in 4-12 weeks"
echo ""
echo -e "${YELLOW}Monitor progress:${NC}"
echo "   • Check Google Search Console daily"
echo "   • Look for crawl errors"
echo "   • Monitor indexing coverage"
echo "   • Track performance data"
echo ""
echo -e "${BLUE}For detailed guide, open:${NC}"
echo "   file://$(pwd)/google-search-console-setup.html"
echo ""
echo "   Or read: GOOGLE_INDEXING_FIX.md"
echo ""

# Open the setup guide
read -p "Press Enter to open the detailed setup guide..." 
open "google-search-console-setup.html" 2>/dev/null || \
xdg-open "google-search-console-setup.html" 2>/dev/null || \
echo "Please manually open: google-search-console-setup.html"

echo ""
echo "🎉 Good luck! Your site will be indexed soon!"
echo ""
