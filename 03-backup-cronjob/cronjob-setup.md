# 🕐 Crontab Setup Guide

## Install the cronjob

```bash
# Edit root's crontab
sudo crontab -e

# Add this line (replace path):
*/5 * * * * /home/ec2-user/backup.sh >> /var/log/backup.log 2>&1
```

## Cron expression breakdown

```
*/5  *    *    *    *
 |   |    |    |    |
 |   |    |    |    +--- Day of week (0-7, 0=Sunday)
 |   |    |    +-------- Month (1-12)
 |   |    +------------- Day of month (1-31)
 |   +------------------ Hour (0-23)
 +---------------------- Minute (0-59, */5 = every 5 minutes)
```

## Verify it's running

```bash
# List active cronjobs
sudo crontab -l

# Watch the backup log
tail -f /var/log/backup.log

# List created backups
ls -lh /mnt/backup/
```

## Troubleshooting

| Issue | Fix |
|-------|-----|
| Permission denied | `chmod +x backup.sh` |
| Cron not running | `sudo systemctl status crond` (or `cron`) |
| No backups created | Check `/var/log/cron` and absolute paths in cron |
