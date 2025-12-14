#!/bin/bash

# FastShortcuts - New Page Creator
# This script creates a new shortcut page with all necessary files and updates

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   FastShortcuts - New Page Creator        ║${NC}"
echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo ""

# Function to prompt user
prompt() {
    echo -e "${YELLOW}$1${NC}"
    read -r response
    echo "$response"
}

# Function to convert to URL-safe name
to_url_safe() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g'
}

# Get tool information
echo -e "${GREEN}Step 1: Tool Information${NC}"
echo ""

TOOL_NAME=$(prompt "Enter tool display name (e.g., Figma, Slack, Jira):")
TOOL_URL=$(to_url_safe "$TOOL_NAME")
KEY_FEATURES=$(prompt "Enter key features (e.g., design, prototyping & collaboration):")
SHORT_DESC=$(prompt "Enter short description (50-80 chars):")
TARGET_AUDIENCE=$(prompt "Enter target audience (e.g., designers, developers):")
PLATFORMS=$(prompt "Enter platforms (e.g., Windows, Mac & Web):")
SHORTCUT_COUNT=$(prompt "Estimated shortcut count (e.g., 100+, 150+):")
OFFICIAL_DOCS=$(prompt "Enter official docs URL (optional, press Enter to skip):")
PRIORITY=$(prompt "Enter sitemap priority (0.7-0.9, default 0.8):")
PRIORITY=${PRIORITY:-0.8}

echo ""
echo -e "${GREEN}Step 2: Creating Directory Structure${NC}"

# Create directory
TOOL_DIR="shortcuts/$TOOL_URL"
if [ -d "$TOOL_DIR" ]; then
    echo -e "${RED}Error: Directory $TOOL_DIR already exists!${NC}"
    exit 1
fi

mkdir -p "$TOOL_DIR"
echo -e "  ✓ Created $TOOL_DIR"

echo ""
echo -e "${GREEN}Step 3: Creating Page from Template${NC}"

# Copy template
cp TEMPLATE_SHORTCUT_PAGE.html "$TOOL_DIR/index.html"

# Get current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Replace placeholders in the new page
sed -i '' "s/\[TOOL NAME\]/$TOOL_NAME/g" "$TOOL_DIR/index.html"
sed -i '' "s/\[tool-name\]/$TOOL_URL/g" "$TOOL_DIR/index.html"
sed -i '' "s/\[KEY FEATURES\]/$KEY_FEATURES/g" "$TOOL_DIR/index.html"
sed -i '' "s/\[TARGET AUDIENCE\]/$TARGET_AUDIENCE/g" "$TOOL_DIR/index.html"
sed -i '' "s/\[PLATFORMS\]/$PLATFORMS/g" "$TOOL_DIR/index.html"
sed -i '' "s/\[SHORT_DESC\]/$SHORT_DESC/g" "$TOOL_DIR/index.html"
sed -i '' "s|YYYY-MM-DD|$CURRENT_DATE|g" "$TOOL_DIR/index.html"

# Handle optional official docs URL
if [ -n "$OFFICIAL_DOCS" ]; then
    sed -i '' "s|\[OFFICIAL_DOCS_URL\]|$OFFICIAL_DOCS|g" "$TOOL_DIR/index.html"
else
    # Remove the official docs link if not provided
    sed -i '' '/<li><a href="\[OFFICIAL_DOCS_URL\]"/d' "$TOOL_DIR/index.html"
fi

echo -e "  ✓ Created $TOOL_DIR/index.html"

echo ""
echo -e "${GREEN}Step 4: Updating Sitemap${NC}"

# Update sitemap.xml - add before closing </urlset>
SITEMAP_ENTRY="  <url>\n    <loc>https://fastshortcuts.com/shortcuts/$TOOL_URL/</loc>\n    <lastmod>$CURRENT_DATE</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>$PRIORITY</priority>\n  </url>\n</urlset>"

# Remove closing </urlset> tag, add new entry, then add closing tag back
sed -i '' 's|</urlset>||g' sitemap.xml
echo -e "$SITEMAP_ENTRY" >> sitemap.xml

echo -e "  ✓ Updated sitemap.xml"

echo ""
echo -e "${GREEN}Step 5: Creating Summary Document${NC}"

# Create a summary document
SUMMARY_FILE="${TOOL_URL}_PAGE_SUMMARY.md"
cat > "$SUMMARY_FILE" << EOF
# $TOOL_NAME Shortcuts Page - Creation Summary

**Created**: $CURRENT_DATE
**URL**: https://fastshortcuts.com/shortcuts/$TOOL_URL/
**Status**: Draft - Needs Content

## Page Information

- **Tool Name**: $TOOL_NAME
- **URL Slug**: $TOOL_URL
- **Key Features**: $KEY_FEATURES
- **Short Description**: $SHORT_DESC
- **Target Audience**: $TARGET_AUDIENCE
- **Platforms**: $PLATFORMS
- **Shortcut Count**: $SHORTCUT_COUNT shortcuts
- **Official Docs**: ${OFFICIAL_DOCS:-Not provided}
- **Sitemap Priority**: $PRIORITY

## Files Created

✅ \`$TOOL_DIR/index.html\` - Main shortcuts page
📝 Sitemap updated with new entry

## Next Steps

### 1. Add Shortcuts Content
Edit \`$TOOL_DIR/index.html\` and add shortcuts in these sections:

- **Windows/Linux Shortcuts** (line ~200)
- **macOS Shortcuts** (line ~400)

Each shortcut should follow this format:
\`\`\`html
<div class="shortcut-item">
    <span class="shortcut-description">Action Name</span>
    <div class="shortcut-keys">
        <kbd class="key">Ctrl</kbd><kbd class="key">Key</kbd>
    </div>
</div>
\`\`\`

### 2. Add SEO Content
Update the tips-section with SEO-optimized article content (starting line ~600):
- Minimum 1500-2000 words
- Include internal links to other shortcut pages
- Add external link to official documentation
- Use relevant keywords naturally

### 3. Create Icon (Optional)
Create an SVG icon and save to:
\`assets/icons/$TOOL_URL.svg\`

### 4. Update Navigation (Manual)
Add this tool to the navigation dropdown in:
- \`index.html\` (homepage)
- All files in \`shortcuts/*/index.html\` (8 files)
- All files in \`pages/*.html\` (4 files)

Add this line to the Tools dropdown:
\`\`\`html
<li><a href="../$TOOL_URL/">$TOOL_NAME</a></li>
\`\`\`

### 5. Update Homepage Category Grid
Add this category card to \`index.html\`:
\`\`\`html
<a href="shortcuts/$TOOL_URL/" class="category-card">
    <div class="category-icon">📦</div>
    <h3>$TOOL_NAME</h3>
    <p class="shortcut-count">$SHORTCUT_COUNT shortcuts</p>
    <p class="category-description">$SHORT_DESC</p>
    <span class="card-arrow">→</span>
</a>
\`\`\`

### 6. Test Locally
\`\`\`bash
python3 -m http.server 8080
# Visit: http://localhost:8080/shortcuts/$TOOL_URL/
\`\`\`

### 7. Commit and Push
\`\`\`bash
git add .
git commit -m "✨ Add $TOOL_NAME shortcuts page ($SHORTCUT_COUNT shortcuts)"
git push origin main
\`\`\`

## SEO Checklist

- [ ] Title tag optimized (<60 chars)
- [ ] Meta description optimized (150-160 chars)
- [ ] Keywords included naturally
- [ ] Structured data (Breadcrumb, TechArticle, FAQ)
- [ ] Canonical URL set
- [ ] Open Graph tags complete
- [ ] Twitter Card tags complete
- [ ] Internal links added (3-5 links)
- [ ] External link to official docs
- [ ] Article content (1500+ words)
- [ ] Mobile responsive tested
- [ ] Sitemap updated ✅

## Template Structure

The page includes:
- ✅ Google Analytics tracking
- ✅ Complete SEO meta tags
- ✅ Schema.org structured data
- ✅ Responsive navigation
- ✅ Platform tabs (Windows/Mac)
- ✅ Search functionality
- ✅ Related shortcuts section
- ✅ Footer with links
- ✅ Mobile menu

## Ready for Content!

The page structure is ready. Now add your shortcuts and SEO content!
EOF

echo -e "  ✓ Created $SUMMARY_FILE"

echo ""
echo -e "${BLUE}═══════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ SUCCESS! New page created successfully!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}📁 Files Created:${NC}"
echo -e "   • $TOOL_DIR/index.html"
echo -e "   • $SUMMARY_FILE"
echo ""
echo -e "${YELLOW}📝 Files Updated:${NC}"
echo -e "   • sitemap.xml"
echo ""
echo -e "${YELLOW}🎯 Next Steps:${NC}"
echo -e "   1. Add shortcuts content to $TOOL_DIR/index.html"
echo -e "   2. Add SEO article content (tips-section)"
echo -e "   3. Update navigation in all pages (see $SUMMARY_FILE)"
echo -e "   4. Test locally: ${GREEN}python3 -m http.server 8080${NC}"
echo -e "   5. View at: ${BLUE}http://localhost:8080/shortcuts/$TOOL_URL/${NC}"
echo ""
echo -e "${YELLOW}📖 Full guide: Read $SUMMARY_FILE${NC}"
echo ""
