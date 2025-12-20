#!/bin/bash

echo "🔍 SCANNING FOR BROKEN LINKS..."
echo "================================"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track issues
ISSUES_FOUND=0

# Function to check if file exists
check_file_exists() {
    local file_path=$1
    local source_file=$2
    
    if [ ! -f "$file_path" ]; then
        echo -e "${RED}❌ BROKEN LINK:${NC} $source_file"
        echo "   → Missing: $file_path"
        ((ISSUES_FOUND++))
        return 1
    fi
    return 0
}

echo "1️⃣  Checking Homepage Links..."
echo "----------------------------"

# Check homepage internal links
if [ -f "index.html" ]; then
    # Extract href links from homepage
    grep -o 'href="[^"]*"' index.html | sed 's/href="//;s/"//' | while read -r link; do
        # Skip external links, anchors, and javascript
        if [[ $link == http* ]] || [[ $link == "#"* ]] || [[ $link == "javascript:"* ]]; then
            continue
        fi
        
        # Remove trailing slash and fragment
        link=$(echo "$link" | sed 's/#.*//' | sed 's/\/$//')
        
        # Skip empty links
        if [ -z "$link" ]; then
            continue
        fi
        
        # Check if file exists
        if [[ $link == /* ]]; then
            # Absolute path from root
            check_file_exists ".${link}" "index.html → $link" || check_file_exists ".${link}/index.html" "index.html → $link"
        else
            # Relative path
            check_file_exists "$link" "index.html → $link" || check_file_exists "${link}/index.html" "index.html → $link"
        fi
    done
fi

echo ""
echo "2️⃣  Checking Shortcut Pages Links..."
echo "-----------------------------------"

# Check all shortcut pages
for file in shortcuts/*/index.html; do
    if [ -f "$file" ]; then
        page_name=$(basename $(dirname "$file"))
        
        # Extract href links
        grep -o 'href="[^"]*"' "$file" | sed 's/href="//;s/"//' | while read -r link; do
            # Skip external links, anchors, and javascript
            if [[ $link == http* ]] || [[ $link == "#"* ]] || [[ $link == "javascript:"* ]]; then
                continue
            fi
            
            # Remove trailing slash and fragment
            link=$(echo "$link" | sed 's/#.*//' | sed 's/\/$//')
            
            # Skip empty links
            if [ -z "$link" ]; then
                continue
            fi
            
            # Construct full path from shortcut page perspective
            if [[ $link == ../* ]]; then
                # Go up from shortcuts/tool/ directory
                full_path="shortcuts/$page_name/$link"
                # Normalize path
                full_path=$(echo "$full_path" | sed 's|shortcuts/[^/]*/\.\./||')
                check_file_exists "$full_path" "$file → $link" || check_file_exists "${full_path}/index.html" "$file → $link"
            fi
        done
    fi
done

echo ""
echo "3️⃣  Checking Pages Directory Links..."
echo "------------------------------------"

# Check pages directory files
for file in pages/*.html; do
    if [ -f "$file" ]; then
        page_name=$(basename "$file")
        
        # Extract href links
        grep -o 'href="[^"]*"' "$file" | sed 's/href="//;s/"//' | while read -r link; do
            # Skip external links, anchors, and javascript
            if [[ $link == http* ]] || [[ $link == "#"* ]] || [[ $link == "javascript:"* ]]; then
                continue
            fi
            
            # Remove trailing slash and fragment
            link=$(echo "$link" | sed 's/#.*//' | sed 's/\/$//')
            
            # Skip empty links
            if [ -z "$link" ]; then
                continue
            fi
            
            # Check from pages/ perspective
            if [[ $link == ../* ]]; then
                full_path="${link#../}"
                check_file_exists "$full_path" "$file → $link" || check_file_exists "${full_path}/index.html" "$file → $link"
            fi
        done
    fi
done

echo ""
echo "4️⃣  Checking Asset Files..."
echo "-------------------------"

# Check CSS files
for file in $(find . -name "*.html" -not -path "./backup*" -not -path "./archive*"); do
    grep -o 'href="[^"]*\.css"' "$file" | sed 's/href="//;s/"//' | while read -r css; do
        css_path=$(dirname "$file")/"$css"
        css_path=$(echo "$css_path" | sed 's|^\./||')
        if [ ! -f "$css_path" ]; then
            echo -e "${RED}❌ MISSING CSS:${NC} $file"
            echo "   → Missing: $css_path"
            ((ISSUES_FOUND++))
        fi
    done
done

# Check JS files
for file in $(find . -name "*.html" -not -path "./backup*" -not -path "./archive*"); do
    grep -o 'src="[^"]*\.js"' "$file" | sed 's/src="//;s/"//' | while read -r js; do
        js_path=$(dirname "$file")/"$js"
        js_path=$(echo "$js_path" | sed 's|^\./||')
        if [ ! -f "$js_path" ]; then
            echo -e "${RED}❌ MISSING JS:${NC} $file"
            echo "   → Missing: $js_path"
            ((ISSUES_FOUND++))
        fi
    done
done

echo ""
echo "================================"
if [ $ISSUES_FOUND -eq 0 ]; then
    echo -e "${GREEN}✅ NO BROKEN LINKS FOUND!${NC}"
else
    echo -e "${YELLOW}⚠️  FOUND $ISSUES_FOUND ISSUES${NC}"
fi
echo "================================"
