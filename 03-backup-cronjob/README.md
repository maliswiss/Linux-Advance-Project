# 💾 Part 3 — Automated Backup with Cronjob

## 🎯 Scenario

> A gaming company's DevOps engineer must back up critical directories (`/home/ec2-user/data`, `/etc`, `/boot`, `/usr`) every 5 minutes. Each backup must have a unique filename containing hostname + timestamp, compressed with `.tgz`.

## 💡 My Approach

1. **Script (`backup.sh`)** creates compressed archives with dynamic naming
2. **Cronjob** triggers the script every 5 minutes
3. Backup destination: `/mnt/backup/`
4. Filename pattern: `<hostname>-<YYYYMMDD>-<HHMM>.tgz`

## ▶️ Usage

### Manual run
```bash
chmod +x backup.sh
sudo ./backup.sh
```

### Schedule with cron
```bash
sudo crontab -e
# Add this line:
*/5 * * * * /home/ec2-user/backup.sh >> /var/log/backup.log 2>&1
```

## 📤 Example Output

```
Backup created: /mnt/backup/web-server-01-20240315-1430.tgz
Size: 142 MB
Duration: 8 seconds
```

## 🔑 Key Concepts

| Concept | Implementation |
|---------|----------------|
| Dynamic filename | `$(hostname)-$(date +%Y%m%d-%H%M).tgz` |
| Compression | `tar -czf` (gzip) |
| Multiple sources | Pass all dirs as args to `tar` |
| Cron syntax | `*/5 * * * *` = every 5 minutes |
| Logging | `>> /var/log/backup.log 2>&1` |
