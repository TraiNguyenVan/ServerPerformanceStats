#!/bin/bash

echo "=============================="
echo "   Server Performance Stats"
echo "=============================="

# OS version
echo ""
echo ">>> OS Version:"
cat /etc/os-release 2>/dev/null | awk -F'=' '/^PRETTY_NAME/{gsub(/"/, "", $2); printf "  %s\n", $2}' || lsb_release -ds 2>/dev/null || uname -sr

# Uptime
echo ""
echo ">>> Uptime:"
uptime -p 2>/dev/null || uptime | awk -F'up ' '{print "  Up " $2}' | awk -F',' '{print $1}'

# Load average
echo ""
echo ">>> Load Average:"
uptime | awk -F'load average:' '{printf "  1min: %.2f  5min: %.2f  15min: %.2f\n", $2, $3, $4}' | sed 's/^  //'

# Logged in users
echo ""
echo ">>> Logged In Users:"
who | awk '{print "  " $1 " from " $5}' | sort -u
WHO_COUNT=$(who | wc -l)
echo "  Total: $WHO_COUNT user(s)"

# Failed login attempts (last 20)
echo ""
echo ">>> Failed Login Attempts (recent):"
if [ -f /var/log/auth.log ]; then
  FAIL_COUNT=$(grep -c "Failed password" /var/log/auth.log 2>/dev/null || echo 0)
  echo "  Total failed: $FAIL_COUNT"
  grep "Failed password" /var/log/auth.log 2>/dev/null | tail -5 | awk '{printf "  %s %s %s %s\n", $1, $2, $3, $9}'
elif [ -f /var/log/secure ]; then
  FAIL_COUNT=$(grep -c "Failed password" /var/log/secure 2>/dev/null || echo 0)
  echo "  Total failed: $FAIL_COUNT"
  grep "Failed password" /var/log/secure 2>/dev/null | tail -5 | awk '{printf "  %s %s %s %s\n", $1, $2, $3, $9}'
else
  echo "  No auth log found (need root or different path)"
fi

# Total CPU usage
echo ""
echo ">>> Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{printf "  User: %.1f%%  System: %.1f%%  Idle: %.1f%%\n", $2, $4, $8}'
CPU_USED=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "  Used: ${CPU_USED}%"

# Total memory usage
echo ""
echo ">>> Total Memory Usage:"
free -m | awk 'NR==2{
  total=$2; used=$3; free=$4; pct=used/total*100
  printf "  Total: %dMB  Used: %dMB  Free: %dMB  Used: %.1f%%\n", total, used, free, pct
}'

# Total disk usage
echo ""
echo ">>> Total Disk Usage:"
df -h / | awk 'NR==2{
  printf "  Total: %s  Used: %s  Free: %s  Used: %s\n", $2, $3, $4, $5
}'

# Top 5 processes by CPU usage
echo ""
echo ">>> Top 5 Processes by CPU Usage:"
ps aux --sort=-%cpu | head -6 | awk 'NR==1{printf "  %-8s %-6s %-6s %s\n", "USER", "%CPU", "%MEM", "COMMAND"} NR>1{printf "  %-8s %-6s %-6s %s\n", $1, $3, $4, $11}'

# Top 5 processes by memory usage
echo ""
echo ">>> Top 5 Processes by Memory Usage:"
ps aux --sort=-%mem | head -6 | awk 'NR==1{printf "  %-8s %-6s %-6s %s\n", "USER", "%CPU", "%MEM", "COMMAND"} NR>1{printf "  %-8s %-6s %-6s %s\n", $1, $3, $4, $11}'

echo ""
echo "=============================="
