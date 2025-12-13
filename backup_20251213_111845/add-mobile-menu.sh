#!/bin/bash

# Script to add mobile menu to all shortcut pages

SHORTCUTS_DIR="/Users/sauravvyas/Desktop/fastshortcuts/shortcuts"

# Mobile menu HTML to insert
MOBILE_MENU='
    <!-- Mobile Menu Overlay -->
    <div class="mobile-menu-overlay"></div>
    
    <!-- Mobile Menu -->
    <div class="mobile-menu">
        <div class="mobile-menu-header">
            <a href="../../" class="logo">
                <span class="logo-icon">⌨️</span>
                <span>FastShortcuts</span>
            </a>
            <button class="mobile-menu-close">✕</button>
        </div>
        <ul class="mobile-nav-links">
            <li><a href="../../">Home</a></li>
            <li><a href="../../#categories">Categories</a></li>
            <li><a href="../vscode/">VS Code</a></li>
            <li><a href="../windows/">Windows</a></li>
            <li><a href="../mac/">Mac</a></li>
            <li><a href="../intellij/">IntelliJ</a></li>
            <li><a href="../chrome/">Chrome</a></li>
            <li><a href="../sublime/">Sublime</a></li>
            <li><a href="../../about">About</a></li>
            <li><a href="../../contact">Contact</a></li>
        </ul>
    </div>
'

echo "Adding mobile menu to shortcut pages..."

for page in vscode windows mac intellij chrome sublime; do
    FILE="$SHORTCUTS_DIR/$page/index.html"
    if [ -f "$FILE" ]; then
        # Check if mobile menu already exists
        if grep -q "mobile-menu-overlay" "$FILE"; then
            echo "✓ Mobile menu already exists in $page/index.html"
        else
            echo "Adding mobile menu to $page/index.html"
            # Add mobile menu after </nav> tag (this is a placeholder - will be done manually)
            echo "  → Please add manually or use sed command"
        fi
    fi
done

echo "Done!"
