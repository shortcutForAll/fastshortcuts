#!/bin/bash

# Update favicon references in all HTML files

FAVICON_CODE='    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="icon" type="image/png" sizes="32x32" href="data:image/svg+xml,<svg xmlns='"'"'http://www.w3.org/2000/svg'"'"' viewBox='"'"'0 0 100 100'"'"'><text y='"'"'.9em'"'"' font-size='"'"'90'"'"'>⌨️</text></svg>">
    <link rel="apple-touch-icon" sizes="180x180" href="data:image/svg+xml,<svg xmlns='"'"'http://www.w3.org/2000/svg'"'"' viewBox='"'"'0 0 100 100'"'"'><text y='"'"'.9em'"'"' font-size='"'"'90'"'"'>⌨️</text></svg>">'

echo "Updating favicon references in all pages..."

# Pages to update (already done index.html)
for file in about.html contact.html privacy.html terms.html 404.html shortcuts/*/index.html; do
  if [ -f "$file" ]; then
    # Replace old favicon line with new multi-format version
    sed -i '' 's|<link rel="icon" href="data:image/svg+xml,<svg xmlns=.*></svg>">|<link rel="icon" type="image/svg+xml" href="/favicon.svg">\
    <link rel="icon" type="image/png" sizes="32x32" href="data:image/svg+xml,<svg xmlns='"'"'http://www.w3.org/2000/svg'"'"' viewBox='"'"'0 0 100 100'"'"'><text y='"'"'.9em'"'"' font-size='"'"'90'"'"'>⌨️</text></svg>">\
    <link rel="apple-touch-icon" sizes="180x180" href="data:image/svg+xml,<svg xmlns='"'"'http://www.w3.org/2000/svg'"'"' viewBox='"'"'0 0 100 100'"'"'><text y='"'"'.9em'"'"' font-size='"'"'90'"'"'>⌨️</text></svg>">|g' "$file"
    echo "✅ Updated $file"
  fi
done

echo ""
echo "✅ All favicon references updated!"
echo ""
echo "Now you should:"
echo "1. Upload favicon.svg to your server root"
echo "2. Optionally create favicon.ico using https://favicon.io/"
