#!/bin/bash

# Quick Google Indexing Status Checker

echo "🔍 Checking FastShortcuts Google Indexing Status"
echo "=================================================="
echo ""

# Check if site is indexed
echo "📊 Opening Google to check indexing status..."
echo ""
open "https://www.google.com/search?q=site:fastshortcuts.com" 2>/dev/null || \
xdg-open "https://www.google.com/search?q=site:fastshortcuts.com" 2>/dev/null || \
echo "Please visit: https://www.google.com/search?q=site:fastshortcuts.com"

sleep 2
echo ""
echo "Results interpretation:"
echo "  • 0 results = Not indexed (follow setup guide)"
echo "  • 1-5 results = Partially indexed (good progress!)"
echo "  • 10+ results = Fully indexed (excellent!)"
echo ""
echo "=================================================="
echo ""
echo "Next steps based on results:"
echo ""
echo "If NOT indexed (0 results):"
echo "  → Run: bash google-indexing-helper.sh"
echo "  → Read: GOOGLE_INDEXING_FIX.md"
echo "  → Open: google-search-console-setup.html"
echo ""
echo "If PARTIALLY indexed (1-10 results):"
echo "  → Check Google Search Console for errors"
echo "  → Request indexing for remaining pages"
echo "  → Keep building backlinks"
echo ""
echo "If FULLY indexed (10+ results):"
echo "  → Focus on ranking optimization"
echo "  → Build more quality backlinks"
echo "  → Create fresh content regularly"
echo ""
