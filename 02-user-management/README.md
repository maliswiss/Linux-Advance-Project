# 👥 Part 2 — Automated User & Password Management

## 🎯 Scenario

> An e-commerce sysadmin is overwhelmed by HR constantly requesting new Linux accounts. The solution: hand HR a single script that creates the user, generates a strong password, and forces a password change on first login.

## 💡 My Approach

1. Accept **username** and **comment** as script arguments
2. Validate: must run as root, username must not exist
3. Generate a **16-character random password** (mixed case + digits + symbols)
4. Create the user with `useradd`
5. Set password using `chpasswd`
6. Force password change on first login with `chage -d 0`
7. Display credentials for HR (one-time only)

## ▶️ Usage

```bash
sudo ./user_password.sh johndoe "John Doe - Marketing Dept"
```

## 📤 Expected Output

```
User 'johndoe' created successfully.
Full name: John Doe - Marketing Dept
Initial password: K7#mN9pQ$rT2xL!4
WARNING: User MUST change password on first login.
```

## 🔐 Security Features

- Requires root (no privilege bypass)
- Refuses to overwrite existing users
- Uses `/dev/urandom` for cryptographic randomness
- Forces password reset on first login
- No password ever written to disk or logs
