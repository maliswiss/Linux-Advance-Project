#!/bin/bash

# ==============================================================================
# Project: AWS CloudTrail Forensics - Find EC2 Instances Terminated by "Paul"
# Author:  Mehmet Ali Gür
# Course:  Clarusway AWS & DevOps Training
# ==============================================================================
# Description:
#   Parses an AWS CloudTrail event_history.csv export to find all EC2 instance
#   IDs that were terminated by the user "Paul", then writes them to result.txt.
#
# Usage:
#   ./script.sh
# ==============================================================================

set -euo pipefail  # Exit on error, undefined var, or pipe failure

# --- Configuration ---
INPUT_FILE="event_history.csv"
OUTPUT_FILE="result.txt"
SUSPECT_USER="Paul"
TARGET_EVENT="TerminateInstances"
INSTANCE_REGEX="i-[a-f0-9]{17}|i-[a-f0-9]{8}"  # Modern (17-char) + legacy (8-char) IDs

# --- Pre-flight checks ---
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "ERROR: Input file '$INPUT_FILE' not found."
    exit 1
fi

echo "Scanning CloudTrail logs for instances terminated by '$SUSPECT_USER'..."

# --- Main logic ---
# 1. Filter rows containing both the suspect user and the terminate event
# 2. Extract instance IDs using Perl-compatible regex
# 3. Remove duplicates and sort
grep "$SUSPECT_USER" "$INPUT_FILE" \
    | grep "$TARGET_EVENT" \
    | grep -oP "$INSTANCE_REGEX" \
    | sort -u \
    > "$OUTPUT_FILE"

# --- Report ---
COUNT=$(wc -l < "$OUTPUT_FILE")
echo "Done. Found $COUNT unique instance ID(s)."
echo "Results saved to: $OUTPUT_FILE"
echo ""
echo "--- Preview ---"
cat "$OUTPUT_FILE"
