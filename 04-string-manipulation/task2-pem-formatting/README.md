# Task 2 — Reformat Single-Line PEM to Multi-Line PEM

## 🎯 Goal
A tool generates a PEM key on a single line. Standard PEM format requires:
- `-----BEGIN CERTIFICATE-----` on its own line
- Base64 body split into 64-character lines
- `-----END CERTIFICATE-----` on its own line

## 🛠️ Solution
- `grep -oP` to extract BEGIN and END markers
- `sed -E` to strip them from the body
- `fold -w 64` to wrap base64 body to 64 chars/line

## ▶️ Run
```bash
chmod +x format-pem.sh
./format-pem.sh certificate.pem.sample new.pem
cat new.pem
```
