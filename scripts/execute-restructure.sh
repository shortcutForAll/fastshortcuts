#!/bin/bash

# FastShortcuts - Execute Complete Restructure
# This script runs the restructure and validates everything
# Run this to completely reorganize your project

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║        FastShortcuts Project Restructure - Complete           ║"
echo "║                   Safe & Automated                             ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Step 1: Show current structure
echo -e "${BLUE}📊 Current Structure:${NC}"
echo "Total files in root:"
ls -1 | wc -l
echo ""

# Step 2: Confirm execution
echo -e "${YELLOW}⚠️  This will:${NC}"
echo "  1. Create automatic backup"
echo "  2. Reorganize all files"
echo "  3. Update all HTML paths"
echo "  4. Create clean structure"
echo ""
read -p "Continue? (yes/no): " -r
if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo -e "${RED}Aborted.${NC}"
    exit 1
fi

# Step 3: Run restructure
echo ""
echo -e "${GREEN}🚀 Starting restructure...${NC}"
./restructure.sh

# Step 4: Validate
echo ""
echo -e "${BLUE}🔍 Validating structure...${NC}"

# Check critical files
echo -n "Checking index.html... "
[[ -f "index.html" ]] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}"

echo -n "Checking assets/css/styles.css... "
[[ -f "assets/css/styles.css" ]] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}"

echo -n "Checking assets/js/script.js... "
[[ -f "assets/js/script.js" ]] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}"

echo -n "Checking shortcuts structure... "
[[ -d "shortcuts" ]] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}"

echo -n "Checking pages structure... "
[[ -d "pages" ]] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}"

echo -n "Checking docs structure... "
[[ -d "docs" ]] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}"

# Step 5: Test local server
echo ""
echo -e "${BLUE}🌐 Testing local server...${NC}"
echo "Starting server on http://localhost:8000"
echo "Press Ctrl+C to stop the server"
echo ""
python3 -m http.server 8000
