# 🐧 Linux Bash Scripting & DevOps Automation

> **Real-world Linux administration scenarios solved with Bash scripting, automation, and DevOps best practices.**

[![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)](https://www.linux.org/)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazonwebservices&logoColor=FF9900)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

---

## 📖 About This Project

This repository contains my solutions to a **4-part DevOps Bash scripting challenge** completed during the **AWS & DevOps Training at Clarusway IT School** (02/2024 – 08/2024).

Each part simulates a **real-world scenario** that a Linux/DevOps engineer faces daily:

- 🔍 **Security forensics** on AWS CloudTrail logs
- 👥 **User account automation** for sysadmins
- 💾 **Backup strategy** with cronjob scheduling
- ✂️ **Text processing** with `sed`, `awk`, `grep`, `cut`

---

## 🗂️ Repository Structure

```
linux-bash-scripting/
│
├── 01-security-cloudtrail/      → CloudTrail log analysis (Bash + grep/awk/sed)
├── 02-user-management/          → User & password automation script
├── 03-backup-cronjob/           → Compressed backup + crontab scheduling
├── 04-string-manipulation/      → Text processing tasks (3 sub-tasks)
│   ├── task1-terraform-update/  → JSON parsing → tf file update
│   ├── task2-pem-formatting/    → PEM key reformatting
│   └── task3-invalid-users/     → SSH auth log analysis
│
├── docs/                        → Original project briefs (PDF)
├── screenshots/                 → Execution screenshots
├── LICENSE                      → MIT License
└── README.md                    → You are here
```

---

## 🎯 Skills Demonstrated

| Skill                        | Where to Find It                                |
|------------------------------|-------------------------------------------------|
| 🐚 **Bash scripting**        | All parts — `.sh` files with error handling     |
| 🔎 **Regex & filtering**     | Part 1 (CloudTrail), Part 4.3 (auth.log)        |
| 🔐 **User/group management** | Part 2 (`useradd`, `chage`, password policies)  |
| ⏰ **Cronjob scheduling**    | Part 3 (`crontab -e`, every 5 min)              |
| 📦 **Archive compression**   | Part 3 (`tar -czf`, dynamic filenames)          |
| 🧰 **Text manipulation**     | Part 4 — `sed`, `awk`, `grep`, `cut`, `uniq`    |
| 🔄 **JSON parsing in Bash**  | Part 4.1 (`grep -oP`, regex)                    |

---

## ⚡ Quick Start

Each part is self-contained. Navigate into a folder and read its local `README.md`:

```bash
# Clone the repo
git clone https://github.com/maliswiss/Linux-Advance-Project.git
cd Linux-Advance-Project

# Run any script (example: backup)
cd 03-backup-cronjob
chmod +x backup.sh
./backup.sh
```

---

## 📚 The 4 Challenges (Quick Overview)

### 🔍 Part 1 — Security Forensics
**Scenario:** A suspicious user terminated EC2 instances. Find all instance IDs from CloudTrail logs.
**Tools:** `grep`, `awk`, `sed`, regex pattern matching
**Output:** `result.txt` with extracted instance IDs

### 👥 Part 2 — User Automation
**Scenario:** HR creates dozens of new Linux accounts. Automate it with one command.
**Tools:** `useradd`, `chpasswd`, `chage`, random password generation
**Output:** New user with auto-generated password, forced change on first login

### 💾 Part 3 — Backup & Cron
**Scenario:** Backup critical folders every 5 minutes with unique compressed filenames.
**Tools:** `tar`, `crontab`, dynamic naming with `hostname` + timestamp
**Output:** `/mnt/backup/hostname-YYYYMMDD-HHMM.tgz`

### ✂️ Part 4 — String Manipulation (3 tasks)
1. **Update Terraform var from JSON** — without opening either file
2. **Reformat single-line PEM → multi-line PEM**
3. **Parse SSH auth.log** — find invalid login attempts and their counts

---

## 📜 Original Project Brief

The full original project specification from Clarusway is available at:
👉 [`docs/Linux-Advanced-Project-Brief.md`](./docs/)

---

## 🛠️ Environment

- **OS:** Amazon Linux 2 / Ubuntu 22.04 LTS
- **Shell:** Bash 5.x
- **Tested on:** AWS EC2 t2.micro

---

## 📖 Resources

- [Bash Scripting Tutorial](https://linuxconfig.org/bash-scripting-tutorial-for-beginners)
- [Grep, Sed, Awk Guide](https://blog.knoldus.com/play-with-text-in-linux-grep-cut-awk-sed/)
- [Crontab Reference](https://man7.org/linux/man-pages/man5/crontab.5.html)

---

## 👤 Author

**Mehmet Ali Gür**
🎓 HF Informatik (Plattformentwicklung) @ GIBB Bern
☁️ AWS DevOps Training @ Clarusway IT School
📍 Bern, Switzerland

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mehmetag/)
[![Email](https://img.shields.io/badge/Email-EA4335?style=flat-square&logo=gmail&logoColor=white)](mailto:malibeyswiss@gmail.com)

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.
