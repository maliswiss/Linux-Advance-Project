#!/bin/bash

# ==============================================================================
# Project: Automated User Creation with Random Password
# Author:  Mehmet Ali Gür
# Course:  Clarusway AWS & DevOps Training
# ==============================================================================
# Description:
#   Creates a Linux user with a randomly generated 16-character password.
#   Forces the user to change their password on first login.
#
# Usage:
#   sudo ./user_password.sh <username> "<comment>"
#
# Example:
#   sudo ./user_password.sh johndoe "John Doe - Marketing"
# ==============================================================================

set -euo pipefail

# --- Pre-flight checks ---
if [[ $EUID -ne 0 ]]; then
    echo "ERROR: This script must be run as root (use sudo)."
    exit 1
fi

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <username> \"<comment>\""
    echo "Example: $0 johndoe \"John Doe - Marketing\""
    exit 1
fi

USERNAME="$1"
COMMENT="$2"

# --- Validate username ---
if id "$USERNAME" &>/dev/null; then
    echo "ERROR: User '$USERNAME' already exists."
    exit 1
fi

# --- Generate secure random password ---
# 16 chars from a strong character set, using /dev/urandom
PASSWORD=$(tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c 16)

# --- Create user ---
useradd -m -c "$COMMENT" -s /bin/bash "$USERNAME"

# --- Set password ---
echo "$USERNAME:$PASSWORD" | chpasswd

# --- Force password change on first login ---
chage -d 0 "$USERNAME"

# --- Report ---
echo "User '$USERNAME' created successfully."
echo "Full name: $COMMENT"
echo "Initial password: $PASSWORD"
echo "WARNING: User MUST change password on first login."
echo ""
echo "Hand these credentials to HR/the user via a secure channel."
