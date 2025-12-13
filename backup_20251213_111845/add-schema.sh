#!/bin/bash

# Script to add Schema.org markup to all shortcut pages
# Run this from the fastshortcuts root directory

echo "Adding Schema.org markup to shortcut pages..."

# Note: This is a reference script
# The actual schema markup has been manually added to ensure accuracy

echo "✓ VS Code - Added BreadcrumbList, TechArticle, and HowTo schema"
echo "✓ Windows - Added BreadcrumbList and TechArticle schema"
echo "Remaining pages to update manually:"
echo "  - Mac shortcuts (shortcuts/mac/index.html)"
echo "  - IntelliJ shortcuts (shortcuts/intellij/index.html)"
echo "  - Chrome shortcuts (shortcuts/chrome/index.html)"
echo "  - Sublime shortcuts (shortcuts/sublime/index.html)"

echo ""
echo "Use SCHEMA_TEMPLATES.md for copy-paste templates"
echo ""
echo "After adding schema, validate at:"
echo "  https://search.google.com/test/rich-results"
echo "  https://validator.schema.org/"
