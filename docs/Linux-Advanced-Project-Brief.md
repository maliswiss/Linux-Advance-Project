# Linux Advanced Project — Original Brief (Clarusway IT School)

> This is the original project specification provided during AWS & DevOps Training (02/2024 – 08/2024).
> Solutions are in the parent repository directories.

## Description
You will be working in different roles during this project and assigned to various tasks. These tasks will be based on the problems faced by a DevOps in his/her daily life.

## Problem Statement
Companies have problems based on their infrastructures and needs. In this project, you will be working in different roles and you will be assigned some tasks which have backing up, security issues, user and password management, and some string manipulation duties. Sometimes, you need to prepare some bash script files or execute some commands, to be able to accomplish them.

## Part 1: Security Issue
You are working in a Financial Company as DevSecOps. Recently, one of your instances has been terminated by someone within the firm. That instance was very important for firm's web-app and also your infrastructure has been affected by this termination. Your team lead is suspecting `Paul` user. You have assigned to find instances' ids terminated by `Paul` user. You have Cloudtrail event history file named `event_history.csv`. Instance ids within this event history look like `i-0c127ab5cdf997cf4`. You have to apply some filtering and string manipulation commands to find ids.

## Part 2: User and Password Script
You're working as a System Administrator for an e-commerce company. The latest company initiative requires you to write an ansible file for dozens of servers. You're falling behind schedule and are going to miss your deadline because you are constantly being interrupted by the HR calling you to create new Linux accounts.

Your script accepts user account name and comments as parameter. Then create a new user and a password for them. At the same time, you want users to change their password, when they login the system at the first time.

## Part 3: Backup and Cronjob
Imagine that you are working in a Gaming company as DevOps Engineer. The folders `/home/ec2-user/data`, `/etc`, `/boot`, and `/usr` need to be backed up and placed in `/mnt/backup` every 5 minutes. Each backup file must have a unique name based on hostname + date-hour-minute, compressed with `.tgz`.

## Part 4: String Manipulation
You are working in a Healthcare Company as DevOps engineer.

### Task 1
Read PrivateIpAddress from `info.json` and inject it into `ec2_private_ip` on line 40 of `terraform.tf` — without opening either file.

### Task 2
Convert a single-line PEM (`certificate.pem`) into proper multi-line PEM (`new.pem`).

### Task 3
Parse `auth.log` to find invalid SSH user names and count their attempts.

## Topics Covered
- Bash Scripting
- Sed, Grep, Awk, Cut, Uniq Commands
- String Manipulation
- Cronjob scheduling
- User & password automation
- Backup strategies

## Resources
- [Grep, Sed, Awk, Cut Commands](https://blog.knoldus.com/play-with-text-in-linux-grep-cut-awk-sed/)
- [Bash Scripting](https://linuxconfig.org/bash-scripting-tutorial-for-beginners)
- [Uniq Command](https://www.geeksforgeeks.org/uniq-command-in-linux-with-examples/)
