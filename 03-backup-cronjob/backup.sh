#!/bin/bash

# ==============================================================================
# Project: Multi-Directory Backup with Dynamic Naming
# Author:  Mehmet Ali Gür
# Course:  Clarusway AWS & DevOps Training
# ==============================================================================
# Description:
#   Creates a compressed (.tgz) backup of critical directories with a unique
#   filename based on the hostname and timestamp. Designed to run via cron
#   every 5 minutes.
#
# Cron entry (sudo crontab -e):
#   */5 * * * * /path/to/backup.sh >> /var/log/backup.log 2>&1
# ==============================================================================

set -euo pipefail

# --- Configuration ---
BACKUP_DEST="/mnt/backup"
SOURCES=(
    "/home/ec2-user/data"
    "/etc"
    "/boot"
    "/usr"
)

# --- Generate dynamic filename ---
HOSTNAME_VAL=$(hostname)
TIMESTAMP=$(date +%Y%m%d-%H%M)
ARCHIVE_NAME="${HOSTNAME_VAL}-${TIMESTAMP}.tgz"
ARCHIVE_PATH="${BACKUP_DEST}/${ARCHIVE_NAME}"

# --- Pre-flight checks ---
if [[ ! -d "$BACKUP_DEST" ]]; then
    echo "Creating backup destination: $BACKUP_DEST"
    mkdir -p "$BACKUP_DEST"
fi

# Filter to only existing sources (some may not exist on all systems)
EXISTING_SOURCES=()
for src in "${SOURCES[@]}"; do
    if [[ -e "$src" ]]; then
        EXISTING_SOURCES+=("$src")
    else
        echo "WARNING: Skipping (not found): $src"
    fi
done

if [[ ${#EXISTING_SOURCES[@]} -eq 0 ]]; then
    echo "ERROR: No valid source directories found."
    exit 1
fi

# --- Create backup ---
START_TIME=$(date +%s)
echo "Starting backup: $ARCHIVE_NAME"
echo "Sources: ${EXISTING_SOURCES[*]}"

tar -czf "$ARCHIVE_PATH" "${EXISTING_SOURCES[@]}" 2>/dev/null || {
    echo "ERROR: Backup failed."
    exit 1
}

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
SIZE=$(du -h "$ARCHIVE_PATH" | cut -f1)

# --- Report ---
echo "Backup created: $ARCHIVE_PATH"
echo "Size: $SIZE"
echo "Duration: ${DURATION}s"
