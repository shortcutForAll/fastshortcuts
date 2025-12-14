#!/bin/bash

# ================================================
# Component Migration Script
# Converts existing pages to use component-based architecture
# ================================================

set -e  # Exit on error

BACKUP_DIR="backup_$(date +%Y%m%d_%H%M%S)"
COMPONENTS_CREATED=0
PAGES_MIGRATED=0

echo "🚀 Starting Component Migration..."
echo "=================================="

# Create backup
echo "📦 Creating backup in $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

# Function to backup a file
backup_file() {
    local file=$1
    if [ -f "$file" ]; then
        local backup_path="$BACKUP_DIR/$file"
        mkdir -p "$(dirname "$backup_path")"
        cp "$file" "$backup_path"
        echo "   ✅ Backed up: $file"
    fi
}

# Function to check if components exist
check_components() {
    echo ""
    echo "🔍 Checking component files..."
    
    if [ ! -f "components/navigation.html" ]; then
        echo "   ❌ Missing: components/navigation.html"
        return 1
    fi
    echo "   ✅ Found: components/navigation.html"
    
    if [ ! -f "components/footer.html" ]; then
        echo "   ❌ Missing: components/footer.html"
        return 1
    fi
    echo "   ✅ Found: components/footer.html"
    
    if [ ! -f "assets/js/components.js" ]; then
        echo "   ❌ Missing: assets/js/components.js"
        return 1
    fi
    echo "   ✅ Found: assets/js/components.js"
    
    return 0
}

# Check components exist
if ! check_components; then
    echo ""
    echo "❌ ERROR: Component files not found!"
    echo "Please ensure components are created first."
    exit 1
fi

echo ""
echo "📝 Migration Plan:"
echo "   1. Backup all files"
echo "   2. Add placeholder divs"
echo "   3. Update script tags"
echo "   4. Validate changes"
echo ""
read -p "Continue? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Migration cancelled."
    exit 0
fi

# List of pages to migrate
PAGES=(
    "shortcuts/vscode/index.html"
    "shortcuts/windows/index.html"
    "shortcuts/mac/index.html"
    "shortcuts/chrome/index.html"
    "shortcuts/intellij/index.html"
    "shortcuts/sublime/index.html"
    "shortcuts/photoshop/index.html"
    "shortcuts/notion/index.html"
)

echo ""
echo "🔄 Migrating pages..."
echo "====================="

for page in "${PAGES[@]}"; do
    if [ -f "$page" ]; then
        echo ""
        echo "📄 Processing: $page"
        
        # Backup the file
        backup_file "$page"
        
        # Create a temporary file
        temp_file="${page}.tmp"
        
        # Note: This is a placeholder - actual migration would require
        # more sophisticated sed/awk commands to:
        # 1. Find and replace <nav> section with placeholder
        # 2. Find and replace <footer> section with placeholder
        # 3. Update script tags
        
        echo "   ⚠️  Manual migration required for this file"
        echo "   Backup created at: $BACKUP_DIR/$page"
        
        ((PAGES_MIGRATED++))
    else
        echo "   ⚠️  File not found: $page"
    fi
done

echo ""
echo "=================================="
echo "✅ Migration Summary:"
echo "   📦 Backups created: $BACKUP_DIR"
echo "   📝 Pages identified: ${#PAGES[@]}"
echo "   ✅ Pages processed: $PAGES_MIGRATED"
echo ""
echo "⚠️  NEXT STEPS:"
echo "   1. Review backed up files in $BACKUP_DIR"
echo "   2. Manually update each page with:"
echo "      - Replace <nav>...</nav> with <div id=\"navigation-placeholder\"></div>"
echo "      - Replace <footer>...</footer> with <div id=\"footer-placeholder\"></div>"
echo "      - Add <script src=\"/assets/js/components.js\"></script> before script.js"
echo "   3. Test each page in browser"
echo "   4. Verify navigation and footer load correctly"
echo ""
echo "📚 See COMPONENT_ARCHITECTURE_GUIDE.md for details"
echo "=================================="
