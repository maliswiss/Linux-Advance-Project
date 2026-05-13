#!/bin/bash

# ==============================================================================
# Task 2: Convert single-line PEM to standard multi-line PEM
# Author: Mehmet Ali Gür
# ==============================================================================
# Usage:
#   ./format-pem.sh <input.pem> <output.pem>
# ==============================================================================

set -euo pipefail

INPUT="${1:-certificate.pem.sample}"
OUTPUT="${2:-new.pem}"

if [[ ! -f "$INPUT" ]]; then
    echo "ERROR: Input file not found: $INPUT"
    exit 1
fi

# Read the single line
LINE=$(cat "$INPUT")

# Extract BEGIN marker, base64 body, END marker
BEGIN=$(echo "$LINE" | grep -oP '\-{5}BEGIN [A-Z ]+\-{5}')
END=$(echo "$LINE" | grep -oP '\-{5}END [A-Z ]+\-{5}')
BODY=$(echo "$LINE" | sed -E "s|-----BEGIN [A-Z ]+-----||; s|-----END [A-Z ]+-----||")

# Write properly formatted PEM
{
    echo "$BEGIN"
    echo "$BODY" | tr -d ' ' | fold -w 64
    echo "$END"
} > "$OUTPUT"

echo "Multi-line PEM written to: $OUTPUT"
echo "--- Preview ---"
head -5 "$OUTPUT"
