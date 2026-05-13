# Task 1 — Inject EC2 Private IP into Terraform File

## 🎯 Goal
Read the `PrivateIpAddress` from `info.json` (AWS describe-instances output) and replace the value of `ec2_private_ip` on line 40 of `terraform.tf` — **without opening either file in an editor**.

## 🛠️ Solution
- Extract IP from JSON using `grep -oP` with regex
- Use `sed -i` to update the target line in `terraform.tf`

## ▶️ Run
```bash
chmod +x command.sh
./command.sh
```

## 📤 Expected Behavior
- Reads `PrivateIpAddress` from `info.json` (here: `10.0.1.42`)
- Updates line 40 of `terraform.tf` so that `ec2_private_ip = "10.0.1.42"`
