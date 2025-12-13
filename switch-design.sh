#!/bin/bash

# ============================================
# FastShortcuts - Design Switcher Script
# ============================================

echo "🎨 FastShortcuts Design Switcher"
echo "=================================="
echo ""
echo "Select an option:"
echo "1) Switch to NEW modern design (recommended)"
echo "2) Switch back to OLD design"
echo "3) View comparison page"
echo "4) Create backup of current design"
echo "5) Exit"
echo ""
read -p "Enter choice [1-5]: " choice

case $choice in
    1)
        echo ""
        echo "📦 Switching to NEW modern design..."
        echo ""
        
        # Backup current files
        if [ -f "index.html" ]; then
            cp index.html index-old-backup.html
            echo "✓ Backed up old index.html"
        fi
        
        if [ -f "styles.css" ]; then
            cp styles.css styles-old-backup.css
            echo "✓ Backed up old styles.css"
        fi
        
        if [ -f "script.js" ]; then
            cp script.js script-old-backup.js
            echo "✓ Backed up old script.js"
        fi
        
        # Switch to new design
        cp index-new.html index.html
        cp styles-new.css styles.css
        cp script-new.js script.js
        
        echo ""
        echo "✅ Successfully switched to NEW design!"
        echo ""
        echo "🚀 Changes:"
        echo "   - Real SVG icons (not emojis)"
        echo "   - Dark mode toggle"
        echo "   - Modern clean theme"
        echo "   - Smooth animations"
        echo ""
        echo "💡 Tip: Test at http://localhost or open index.html"
        echo ""
        echo "🔄 To rollback, run this script and choose option 2"
        ;;
    
    2)
        echo ""
        echo "⏪ Switching back to OLD design..."
        echo ""
        
        if [ -f "index-old-backup.html" ]; then
            cp index-old-backup.html index.html
            echo "✓ Restored old index.html"
        else
            echo "❌ No backup found for index.html"
        fi
        
        if [ -f "styles-old-backup.css" ]; then
            cp styles-old-backup.css styles.css
            echo "✓ Restored old styles.css"
        else
            echo "❌ No backup found for styles.css"
        fi
        
        if [ -f "script-old-backup.js" ]; then
            cp script-old-backup.js script.js
            echo "✓ Restored old script.js"
        else
            echo "❌ No backup found for script.js"
        fi
        
        echo ""
        echo "✅ Switched back to OLD design"
        ;;
    
    3)
        echo ""
        echo "🔍 Opening comparison page..."
        open comparison.html
        echo "✅ Comparison page opened in browser"
        ;;
    
    4)
        echo ""
        echo "💾 Creating backup..."
        
        BACKUP_DIR="backup-$(date +%Y%m%d-%H%M%S)"
        mkdir -p "$BACKUP_DIR"
        
        cp index.html "$BACKUP_DIR/" 2>/dev/null
        cp styles.css "$BACKUP_DIR/" 2>/dev/null
        cp script.js "$BACKUP_DIR/" 2>/dev/null
        
        echo "✅ Backup created in: $BACKUP_DIR"
        ;;
    
    5)
        echo ""
        echo "👋 Goodbye!"
        exit 0
        ;;
    
    *)
        echo ""
        echo "❌ Invalid choice. Please run the script again."
        ;;
esac

echo ""
