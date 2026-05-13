# Task 3 — Find Invalid SSH Login Attempts

## 🎯 Goal
Parse `auth.log` (SSH server log) to find every invalid user that tried to log in, and how many times each attempted.

## 🛠️ Solution
- `grep "Invalid user"` to filter relevant lines
- `awk` to extract the username (field after "Invalid user")
- `sort | uniq -c` to count occurrences
- `sort -rn` to order by count descending

## ▶️ Run
```bash
chmod +x invalid_user.sh
./invalid_user.sh auth.log.sample
```

## 📤 Example Output
```
      3 admin
      2 oracle
      2 root
      1 test
      1 ubuntu
```
