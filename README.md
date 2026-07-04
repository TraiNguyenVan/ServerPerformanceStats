# Server Performance Stats

> Project from [roadmap.sh](https://roadmap.sh/projects/server-stats)

A bash script that analyses basic server performance stats on any Linux server.

## Features

| Stat | Description |
|------|-------------|
| OS Version | Linux distribution and version |
| Uptime | How long the server has been running |
| Load Average | System load over 1, 5, and 15 minutes |
| Logged In Users | Active sessions and their origins |
| Failed Login Attempts | Total count with recent entries |
| CPU Usage | User, system, and overall utilization |
| Memory Usage | Total, used, free, and percentage |
| Disk Usage | Total, used, free, and percentage |
| Top Processes (CPU) | Top 5 processes consuming the most CPU |
| Top Processes (Memory) | Top 5 processes consuming the most memory |

## Quick Start

```bash
git clone https://github.com/TraiNguyenVan/ServerPerformanceStats.git
cd ServerPerformanceStats
chmod +x server-stats.sh
./server-stats.sh
```

## Example Output

```
==============================
   Server Performance Stats
==============================

>>> OS Version:
  Fedora Linux 43 (Server Edition)

>>> Uptime:
up 4 hours, 47 minutes

>>> Load Average:
1min: 4.34  5min: 0.00  15min: 0.00

>>> Logged In Users:
  trai from (192.168.1.100)
  Total: 1 user(s)

>>> Failed Login Attempts (recent):
  Total failed: 0

>>> Total CPU Usage:
  User: 76.2%  System: 4.8%  Idle: 19.0%
  Used: 79.1%

>>> Total Memory Usage:
  Total: 7821MB  Used: 6243MB  Free: 137MB  Used: 79.8%

>>> Total Disk Usage:
  Total: 221G  Used: 145G  Free: 77G  Used: 66%

>>> Top 5 Processes by CPU Usage:
  USER     %CPU   %MEM   COMMAND
  trai     144    16.0   java
  trai     100    0.0    ps
  trai     66.9   10.2   opencode
  trai     17.3   9.7    opencode
  avahi    5.2    0.0    avahi-daemon:

>>> Top 5 Processes by Memory Usage:
  USER     %CPU   %MEM   COMMAND
  trai     144    16.0   java
  trai     66.9   10.2   opencode
  trai     17.3   9.7    opencode
  trai     3.3    8.8    node
  trai     2.1    7.6    node

==============================
```

## Commands Used

| Command | Purpose | Docs |
|---------|---------|------|
| `awk` | Text processing and pattern scanning | [GNU Awk](https://www.gnu.org/software/gawk/manual/gawk.html) |
| `cat` | Read and display file contents | [cat man](https://www.gnu.org/software/coreutils/cat) |
| `df` | Report disk space usage | [df man](https://www.gnu.org/software/coreutils/df) |
| `echo` | Print text to terminal | [echo man](https://www.gnu.org/software/coreutils/echo) |
| `free` | Display memory usage | [free man](https://man7.org/linux/man-pages/man1/free.1.html) |
| `grep` | Search text using patterns | [GNU Grep](https://www.gnu.org/software/grep/manual/grep.html) |
| `head` | Output the first lines of a file | [head man](https://www.gnu.org/software/coreutils/head) |
| `ps` | Report process status | [ps man](https://man7.org/linux/man-pages/man1/ps.1.html) |
| `sed` | Stream editor for filtering text | [GNU Sed](https://www.gnu.org/software/sed/manual/sed.html) |
| `sort` | Sort lines of text files | [sort man](https://www.gnu.org/software/coreutils/sort) |
| `tail` | Output the last lines of a file | [tail man](https://www.gnu.org/software/coreutils/tail) |
| `top` | Display and update process info | [top man](https://man7.org/linux/man-pages/man1/top.1.html) |
| `uptime` | Show how long the system has been running | [uptime man](https://man7.org/linux/man-pages/man1/uptime.1.html) |
| `wc` | Word, line, character count | [wc man](https://www.gnu.org/software/coreutils/wc) |
| `who` | Show who is logged in | [who man](https://www.gnu.org/software/coreutils/who) |

## License

[MIT](LICENSE)
