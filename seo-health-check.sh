#!/bin/bash

# FastShortcuts SEO Health Check Script
# Checks for common SEO issues that prevent Google indexing

echo "🔍 FastShortcuts SEO Health Check"
echo "=================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check 1: Robots.txt
echo "1️⃣  Checking robots.txt..."
if grep -q "Disallow: /" robots.txt 2>/dev/null && ! grep -q "Allow: /" robots.txt; then
    echo -e "${RED}❌ CRITICAL: robots.txt is blocking all crawlers!${NC}"
else
    echo -e "${GREEN}✅ robots.txt is allowing crawlers${NC}"
fi

# Check 2: Sitemap existence and dates
echo ""
echo "2️⃣  Checking sitemap.xml..."
if [ -f "sitemap.xml" ]; then
    echo -e "${GREEN}✅ sitemap.xml exists${NC}"
    
    # Check if dates are current (within last 30 days)
    CURRENT_DATE=$(date +%Y-%m)
    SITEMAP_DATE=$(grep -m 1 "<lastmod>" sitemap.xml | sed 's/.*<lastmod>\(.*\)<\/lastmod>.*/\1/' | cut -d'-' -f1,2)
    
    if [ "$SITEMAP_DATE" == "$CURRENT_DATE" ]; then
        echo -e "${GREEN}✅ Sitemap dates are current ($SITEMAP_DATE)${NC}"
    else
        echo -e "${YELLOW}⚠️  Sitemap dates may be outdated (found: $SITEMAP_DATE, current: $CURRENT_DATE)${NC}"
    fi
else
    echo -e "${RED}❌ sitemap.xml is missing!${NC}"
fi

# Check 3: Meta robots tags
echo ""
echo "3️⃣  Checking meta robots tags..."
if grep -q 'name="robots".*content="noindex' index.html; then
    echo -e "${RED}❌ CRITICAL: Homepage has noindex tag!${NC}"
elif grep -q 'name="robots".*content="index' index.html; then
    echo -e "${GREEN}✅ Homepage allows indexing${NC}"
else
    echo -e "${YELLOW}⚠️  No robots meta tag found (defaults to index)${NC}"
fi

# Check 4: Title tags
echo ""
echo "4️⃣  Checking title tags..."
TITLE=$(grep -m 1 "<title>" index.html)
if [ -n "$TITLE" ]; then
    TITLE_LENGTH=$(echo "$TITLE" | sed 's/<[^>]*>//g' | wc -c | tr -d ' ')
    if [ "$TITLE_LENGTH" -gt 30 ] && [ "$TITLE_LENGTH" -lt 70 ]; then
        echo -e "${GREEN}✅ Title tag is optimal length ($TITLE_LENGTH chars)${NC}"
    else
        echo -e "${YELLOW}⚠️  Title tag length may not be optimal ($TITLE_LENGTH chars, recommended: 30-60)${NC}"
    fi
    echo "   Title: $(echo $TITLE | sed 's/<[^>]*>//g')"
else
    echo -e "${RED}❌ No title tag found!${NC}"
fi

# Check 5: Meta description
echo ""
echo "5️⃣  Checking meta description..."
META_DESC=$(grep -m 1 'name="description"' index.html)
if [ -n "$META_DESC" ]; then
    DESC_LENGTH=$(echo "$META_DESC" | sed 's/.*content="\([^"]*\)".*/\1/' | wc -c | tr -d ' ')
    if [ "$DESC_LENGTH" -gt 120 ] && [ "$DESC_LENGTH" -lt 170 ]; then
        echo -e "${GREEN}✅ Meta description is optimal length ($DESC_LENGTH chars)${NC}"
    else
        echo -e "${YELLOW}⚠️  Meta description may not be optimal ($DESC_LENGTH chars, recommended: 120-160)${NC}"
    fi
else
    echo -e "${RED}❌ No meta description found!${NC}"
fi

# Check 6: H1 tags
echo ""
echo "6️⃣  Checking H1 tags..."
H1_COUNT=$(grep -c "<h1" index.html)
if [ "$H1_COUNT" -eq 1 ]; then
    echo -e "${GREEN}✅ Exactly one H1 tag found (optimal)${NC}"
    H1_TEXT=$(grep "<h1" index.html | sed 's/<[^>]*>//g' | sed 's/^[ \t]*//')
    echo "   H1: $H1_TEXT"
elif [ "$H1_COUNT" -eq 0 ]; then
    echo -e "${RED}❌ No H1 tag found!${NC}"
else
    echo -e "${YELLOW}⚠️  Multiple H1 tags found ($H1_COUNT)${NC}"
fi

# Check 7: Canonical URL
echo ""
echo "7️⃣  Checking canonical URL..."
if grep -q 'rel="canonical"' index.html; then
    echo -e "${GREEN}✅ Canonical URL is set${NC}"
    CANONICAL=$(grep 'rel="canonical"' index.html | sed 's/.*href="\([^"]*\)".*/\1/')
    echo "   Canonical: $CANONICAL"
else
    echo -e "${YELLOW}⚠️  No canonical URL set${NC}"
fi

# Check 8: Open Graph tags
echo ""
echo "8️⃣  Checking Open Graph tags..."
if grep -q 'property="og:' index.html; then
    echo -e "${GREEN}✅ Open Graph tags present${NC}"
    
    if grep -q 'property="og:image"' index.html; then
        OG_IMAGE=$(grep 'property="og:image"' index.html | sed 's/.*content="\([^"]*\)".*/\1/')
        if [[ $OG_IMAGE == *"TODO"* ]] || [[ $OG_IMAGE == *"placeholder"* ]]; then
            echo -e "${YELLOW}⚠️  OG image is placeholder: $OG_IMAGE${NC}"
        else
            echo -e "${GREEN}✅ OG image is set: $OG_IMAGE${NC}"
        fi
    else
        echo -e "${YELLOW}⚠️  No OG image tag${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  No Open Graph tags found${NC}"
fi

# Check 9: Structured Data (Schema.org)
echo ""
echo "9️⃣  Checking structured data..."
if grep -q 'application/ld+json' index.html; then
    SCHEMA_COUNT=$(grep -c 'application/ld+json' index.html)
    echo -e "${GREEN}✅ Structured data found ($SCHEMA_COUNT schemas)${NC}"
else
    echo -e "${YELLOW}⚠️  No structured data found${NC}"
fi

# Check 10: SSL/HTTPS
echo ""
echo "🔟 Checking HTTPS configuration..."
if grep -q 'https://fastshortcuts.com' index.html sitemap.xml 2>/dev/null; then
    echo -e "${GREEN}✅ HTTPS URLs configured${NC}"
else
    echo -e "${RED}❌ No HTTPS URLs found (http only)${NC}"
fi

# Check 11: Mobile viewport
echo ""
echo "1️⃣1️⃣  Checking mobile viewport..."
if grep -q 'name="viewport"' index.html; then
    echo -e "${GREEN}✅ Mobile viewport meta tag present${NC}"
else
    echo -e "${RED}❌ No viewport meta tag (not mobile friendly)${NC}"
fi

# Check 12: Google Analytics
echo ""
echo "1️⃣2️⃣  Checking Google Analytics..."
if grep -q 'gtag.js' index.html || grep -q 'analytics.js' index.html; then
    echo -e "${GREEN}✅ Google Analytics detected${NC}"
    GA_ID=$(grep -o 'G-[A-Z0-9]*' index.html | head -1)
    echo "   ID: $GA_ID"
else
    echo -e "${YELLOW}⚠️  No Google Analytics found${NC}"
fi

# Summary
echo ""
echo "=================================="
echo "📊 Health Check Complete!"
echo "=================================="
echo ""
echo "🔧 Quick Fixes if needed:"
echo "   1. Update sitemap dates: sed -i '' 's/2025-12-../2026-01-03/g' sitemap.xml"
echo "   2. Submit sitemap to Google: https://search.google.com/search-console"
echo "   3. Check Google Search Console for crawl errors"
echo "   4. Verify robots.txt: https://fastshortcuts.com/robots.txt"
echo ""
