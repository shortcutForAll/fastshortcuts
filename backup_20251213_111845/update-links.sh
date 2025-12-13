#!/bin/bash

# Script to update all internal links in shortcut pages

echo "Updating Windows page..."
cd /Users/sauravvyas/Desktop/fastshortcuts/shortcuts/windows

# Update navigation links
sed -i '' 's|href="index.html"|href="../../index.html"|g' index.html
sed -i '' 's|href="index.html#categories"|href="../../index.html#categories"|g' index.html
sed -i '' 's|href="vscode.html"|href="../vscode/"|g' index.html
sed -i '' 's|href="windows.html"|href="../windows/"|g' index.html
sed -i '' 's|href="mac.html"|href="../mac/"|g' index.html
sed -i '' 's|href="intellij.html"|href="../intellij/"|g' index.html

# Update CSS and JS paths
sed -i '' 's|href="styles.css"|href="../../styles.css"|g' index.html
sed -i '' 's|src="script.js"|src="../../script.js"|g' index.html

echo "Updating Mac page..."
cd /Users/sauravvyas/Desktop/fastshortcuts/shortcuts/mac

sed -i '' 's|href="index.html"|href="../../index.html"|g' index.html
sed -i '' 's|href="index.html#categories"|href="../../index.html#categories"|g' index.html
sed -i '' 's|href="vscode.html"|href="../vscode/"|g' index.html
sed -i '' 's|href="windows.html"|href="../windows/"|g' index.html
sed -i '' 's|href="mac.html"|href="../mac/"|g' index.html
sed -i '' 's|href="intellij.html"|href="../intellij/"|g' index.html
sed -i '' 's|href="styles.css"|href="../../styles.css"|g' index.html
sed -i '' 's|src="script.js"|src="../../script.js"|g' index.html

echo "Updating IntelliJ page..."
cd /Users/sauravvyas/Desktop/fastshortcuts/shortcuts/intellij

sed -i '' 's|href="index.html"|href="../../index.html"|g' index.html
sed -i '' 's|href="index.html#categories"|href="../../index.html#categories"|g' index.html
sed -i '' 's|href="vscode.html"|href="../vscode/"|g' index.html
sed -i '' 's|href="windows.html"|href="../windows/"|g' index.html
sed -i '' 's|href="mac.html"|href="../mac/"|g' index.html
sed -i '' 's|href="intellij.html"|href="../intellij/"|g' index.html
sed -i '' 's|href="styles.css"|href="../../styles.css"|g' index.html
sed -i '' 's|src="script.js"|src="../../script.js"|g' index.html

echo "Updating Chrome page..."
cd /Users/sauravvyas/Desktop/fastshortcuts/shortcuts/chrome

sed -i '' 's|href="index.html"|href="../../index.html"|g' index.html
sed -i '' 's|href="index.html#categories"|href="../../index.html#categories"|g' index.html
sed -i '' 's|href="vscode.html"|href="../vscode/"|g' index.html
sed -i '' 's|href="windows.html"|href="../windows/"|g' index.html
sed -i '' 's|href="mac.html"|href="../mac/"|g' index.html
sed -i '' 's|href="intellij.html"|href="../intellij/"|g' index.html
sed -i '' 's|href="styles.css"|href="../../styles.css"|g' index.html
sed -i '' 's|src="script.js"|src="../../script.js"|g' index.html

echo "Updating Sublime page..."
cd /Users/sauravvyas/Desktop/fastshortcuts/shortcuts/sublime

sed -i '' 's|href="index.html"|href="../../index.html"|g' index.html
sed -i '' 's|href="index.html#categories"|href="../../index.html#categories"|g' index.html
sed -i '' 's|href="vscode.html"|href="../vscode/"|g' index.html
sed -i '' 's|href="windows.html"|href="../windows/"|g' index.html
sed -i '' 's|href="mac.html"|href="../mac/"|g' index.html
sed -i '' 's|href="intellij.html"|href="../intellij/"|g' index.html
sed -i '' 's|href="styles.css"|href="../../styles.css"|g' index.html
sed -i '' 's|src="script.js"|src="../../script.js"|g' index.html

echo "✅ All links updated successfully!"
