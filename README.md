# oss-audit-24bas10101
> VITyarthi | Open Source Software — OSS NGMC Capstone Project

Name:  Anoushka Bakshi
Registration Number: 24BAS10101
Slot: B22
Software: Linux Kernel

## Project Overview
This repository contains a structured audit of the Linux Kernel, focusing on its history, licensing (GPL v2), and technical architecture. The project is focused on understanding Free and Open Source Software (FOSS) principles through practical shell scripting and system analysis.

## Software
**Linux Kernel** 
**License** - GNU General Public License version 2 (GPL v2)

The Linux kernel is a free and open-source , Unix-like kernel that is used in many computer systems worldwide. The kernel was created by Linus Torvalds in 1991 and was soon adopted as the kernel for the GNU operating system (OS) which was created to be a free replacement for Unix. Linus Torvalds was a student who wanted a free Unix-like system and could not afford one. He wanted to access his university's Unix servers from his 386 PC but found the existing options too expensive or limited. 

---

## Repository Structure
```bash
oss-audit-24bas10101
├── README.md
├── script_1.sh
├── script_2.sh
├── script_3.sh
├── script_4.sh
└── script_5.sh
```

## Script Descriptions

### Script 1 - System Identity Report
Captures and displays real-time system metadata (Kernel version, Distro, Uptime, Home Directory etc.) using command substitution and variables.

---

### Script 2 - FOSS Package Inspector
This script audits the "Linux Footprint" by checking if the kernel metapackages are correctly indexed in the package manager. Concepts used are Defensive Programming, Output Redirection &> /dev/null, Case Statement, Data Parsing.

---

### Script 3 - Disk and Permission Auditor
This script automates the process of checking system health and security by auditing the sizes and permissions of critical Linux directories. Uses Bash arrays and for loops to audit the disk usage and security permissions of critical system paths like /etc and /boot.

---

### Script 4 - Log File Analyzer
This Script Demonstrates file I/O by reading log files line-by-line using a while-read loop to count specific keyword occurrences (e.g., "error").

---

### Script 5 - Manifesto Generator
This script demonstrates User-Computer Interaction (HCI) and persistent file storage by generating a customized text file based on user input. An interactive script using read -p and block redirection {...} > file to generate a personalized FOSS manifesto.

---

## Dependencies

| Tool | Used In | Install (Ubuntu/Debian) |
|------|---------|--------------------------|
| `bash` | All scripts | Pre-installed |
| `util-linux` | Script 1 | Pre-installed |
| `gawk` | Script 2 & 3 | `sudo apt install gawk` |
| `coreutils` | All scripts | Pre-installed |
| `grep` | Script 1 & 4 | Pre-installed |

> Tested on Kali-linux-2026.1 (Virtual Box on Windows 11).

---

## How to Run

### Step 1 — Clone the repo

```bash
git clone https://github.com/anoushkabakshi/oss-audit-24bas10101.git
cd oss-audit-24bcy10356
```

### Step 2 — Make scripts executable

```bash
chmod +x *.sh
```

### Script 1

```bash
./script_1.sh
```

### Script 2

```bash
./script_2.sh
```

> If the kernel package is not indexed: `sudo apt update`

### Script 3

```bash
./script_3.sh
```

### Script 4

```bash
sudo ./script_4.sh /var/log/messages error
```

> Needs `sudo` to read system logs. For the syslog specifically:
> ```bash
> sudo ./script_4.sh /var/log/syslog error
> ```
> If the log doesn't exist yet, generate a test file:
> ```bash
> sudo journalctl > /tmp/test.log && ./script_4.sh /tmp/test.log error
> ```

### Script 5

```bash
./script_5.sh
```

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `Permission denied` | Run `chmod +x scriptname.sh` |
| `dpkg: command not found` | Ensure you are on Kali/Debian; Arch uses `pacman` |
| Script 2 shows "NOT installed" | Run `sudo apt update` or check the package name in the script |
| Script 4 log file not found | Use sudo or check if `/var/log/messages` exists |
| Script 3 shows "Not found" | Ensure you have `sudo` privileges for system paths |

---

## References

- Linux Kernel Archives: https://www.kernel.org/category/about.html
- The Linux Foundation: https://www.linuxfoundation.org/
- GNU General Public License v2.0: https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
- Debian Package Management Docs: https://www.debian.org/doc/manuals/debian-faq/pkg-basics.en.html
- Bash Scripting Guide: https://www.gnu.org/software/bash/manual/bash.html
- Linux Man Pages (Project Docs): https://man7.org/linux/man-pages/
- FOSS Philosophy (Free Software Foundation): https://www.gnu.org/philosophy/free-sw.html







 
