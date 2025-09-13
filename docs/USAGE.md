# 🩺 Health Check Script – Usage Guide

## 📌 Overview
The `health_check.sh` script provides a quick system health summary including **CPU usage, memory usage, and disk usage**.  
It is modular and can be extended with additional checks.

---

## ⚙️ Requirements
- Linux / WSL environment
- `bash` shell
- Optional tools for better accuracy:
  - [`sysstat`](https://man7.org/linux/man-pages/man1/mpstat.1.html) (`mpstat` command)

Install with:
```bash
sudo apt update && sudo apt install sysstat -y
```

---

## 🚀 Usage

### 1. Make the script executable
```bash
chmod +x health_check.sh
```

### 2. Run the script
```bash
./health_check.sh
```

Example output:
```
==================================
   🩺 System Health Check Report
==================================
🔹 Checking CPU usage...
Total CPU Usage: 12.5%

🔹 Checking Memory usage...
Used: 2.1G / Total: 7.7G (27.27%)

🔹 Checking Disk usage...
Filesystem      Use% Mounted on
/dev/sda1       45%  /
/dev/sdb1       67%  /data

✅ Health check complete!
```

---

## 📊 Features

- **CPU Check**  
  Uses `mpstat` (if available), otherwise falls back to `top` or `/proc/stat`  
  → Reports **total CPU usage %**

- **Memory Check**  
  Reports memory used vs total, with percentage.

- **Disk Check**  
  Displays usage of mounted filesystems (ignores `tmpfs`/`udev`).

---

## 🛠️ Future Extensions
- Add **network usage checks** (`ifstat`, `vnstat`)
- Add **process checks** (e.g., top 5 memory-hungry processes)
- Logging to a file (`health_report.log`) for audits
