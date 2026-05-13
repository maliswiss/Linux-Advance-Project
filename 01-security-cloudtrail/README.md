# 🔍 Part 1 — CloudTrail Security Forensics

## 🎯 Scenario

> A financial company's DevSecOps engineer is investigating who terminated critical EC2 instances. The suspect is user **Paul**. Using AWS CloudTrail event history (`event_history.csv`), extract all EC2 instance IDs that Paul terminated.

## 💡 My Approach

CloudTrail exports event history as CSV. Each row contains:
- `Event time`, `User name`, `Event name`, `Resource type`, `Resource name`

We need to filter:
1. **User name** = `Paul`
2. **Event name** = `TerminateInstances`
3. Extract the **instance ID** (format: `i-0c127ab5cdf997cf4`) from the resources column

## 🛠️ Solution — `script.sh`

The script uses:
- `grep` → filter rows with user "Paul" AND event "TerminateInstances"
- `grep -oP` → regex extraction of instance IDs matching pattern `i-[a-f0-9]{17}`
- Output → `result.txt`

## ▶️ Usage

```bash
chmod +x script.sh
./script.sh
cat result.txt
```

## 📤 Expected Output (`result.txt`)

```
i-04e8d1b9a23f6e1d0
i-0a7c5e3b8d9f2a4c1
i-0c127ab5cdf997cf4
```

## 🔑 Key Linux Commands Used

| Command | Purpose |
|---------|---------|
| `grep "Paul"` | Filter rows by username |
| `grep "TerminateInstances"` | Filter by event type |
| `grep -oP "i-[a-f0-9]{17}"` | Extract instance ID via Perl regex |
| `sort -u` | Remove duplicates |
