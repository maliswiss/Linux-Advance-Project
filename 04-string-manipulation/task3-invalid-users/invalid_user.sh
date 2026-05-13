#!/bin/bash

# ==============================================================================
# Task 3: Count invalid SSH login attempts per username
# Author: Mehmet Ali Gür
# ==============================================================================
# Usage:
#   ./invalid_user.sh [log_file]
# Default: auth.log
# ==============================================================================

set -euo pipefail

LOG_FILE="${1:-auth.log}"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "ERROR: Log file not found: $LOG_FILE"
    exit 1
fi

echo "Scanning $LOG_FILE for invalid login attempts..."
echo ""
echo "Count    Username"
echo "-----    --------"

# 1. Filter lines with "Invalid user"
# 2. Extract the username (word right after "Invalid user")
# 3. Sort and count unique
# 4. Sort by count descending
grep "Invalid user" "$LOG_FILE" \
    | awk '{for(i=1;i<=NF;i++) if($i=="user") print $(i+1)}' \
    | sort \
    | uniq -c \
    | sort -rn
