#!/bin/bash

# Change to the directory of pdf file
cd $(dirname "$1")
pdf=$(basename "$1")
EXTRACT_FILE=booky_bookmarks_extract
bkFile="$2"

echo "Converting $bkFile to pdftk compatible format"
python3 booky.py < "$bkFile" > "$EXTRACT_FILE"

echo "Creating new pdf with your bookmarks..."
pdftk "$pdf" update_info_utf8 "$EXTRACT_FILE" output "${pdf%.*}""_new.pdf"

echo "Deleting leftovers"
rm "$EXTRACT_FILE"
