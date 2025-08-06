#!/bin/bash

echo "=== Local File Verification Script ==="
echo "Date: $(date)"
echo ""

# Check if we're in the right directory
if [ ! -d "public" ]; then
    echo "❌ Error: public directory not found"
    echo "Current directory: $(pwd)"
    exit 1
fi

echo "✅ Public directory found"
echo ""

# Verify CSS file
if [ -f "public/css/styles.css" ]; then
    echo "✅ CSS file found: public/css/styles.css"
    echo "   File size: $(du -h public/css/styles.css | cut -f1)"
    echo "   Line count: $(wc -l < public/css/styles.css)"
    echo "   Last modified: $(stat -c %y public/css/styles.css 2>/dev/null || stat -f %Sm public/css/styles.css 2>/dev/null)"
    echo ""
    echo "First 5 lines:"
    head -5 public/css/styles.css
    echo ""
    echo "Last 5 lines:"
    tail -5 public/css/styles.css
else
    echo "❌ CSS file not found!"
fi

echo ""
echo "=== HTML Files ==="
for file in public/*.html; do
    if [ -f "$file" ]; then
        echo "✅ Found: $(basename "$file") ($(wc -l < "$file") lines)"
    fi
done

echo ""
echo "=== Git Status ==="
git status --porcelain

echo ""
echo "=== Recent Commits ==="
git log --oneline -3

echo ""
echo "=== File checksums (for comparison) ==="
if [ -f "public/css/styles.css" ]; then
    echo "CSS checksum: $(md5sum public/css/styles.css 2>/dev/null || md5 public/css/styles.css 2>/dev/null)"
fi

echo ""
echo "=== Verification Complete ==="
