#!/bin/bash

# ==============================================================================
# Task 1: Inject EC2 Private IP from info.json into terraform.tf (line 40)
# Author: Mehmet Ali Gür
# ==============================================================================

set -euo pipefail

JSON_FILE="info.json"
TF_FILE="terraform.tf"
TARGET_LINE=40

# Extract PrivateIpAddress from JSON using grep + Perl regex
# Pattern: "PrivateIpAddress": "10.0.1.42"
PRIVATE_IP=$(grep -oP '"PrivateIpAddress"\s*:\s*"\K[0-9.]+' "$JSON_FILE")

if [[ -z "$PRIVATE_IP" ]]; then
    echo "ERROR: Could not extract PrivateIpAddress from $JSON_FILE"
    exit 1
fi

echo "Found Private IP: $PRIVATE_IP"

# Replace the value of ec2_private_ip on line 40 using sed
# Pattern matches: ec2_private_ip = "anything"
sed -i "${TARGET_LINE}s|\(ec2_private_ip\s*=\s*\"\)[^\"]*\(\"\)|\1${PRIVATE_IP}\2|" "$TF_FILE"

echo "Updated line $TARGET_LINE in $TF_FILE"
echo "--- Result ---"
sed -n "${TARGET_LINE}p" "$TF_FILE"
