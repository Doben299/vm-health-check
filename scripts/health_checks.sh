#!/bin/bash
# health_check.sh - Simple system health check script

# ----------------------------
# Function: CPU Usage Check
# ----------------------------
check_cpu() {
    echo "🔹 Checking CPU usage..."
    # Get top 1-minute average load
    cpu_load=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1 | xargs)
    echo "CPU Load (1 min): $cpu_load"
    echo
}

# ----------------------------
# Function: Memory Usage Check
# ----------------------------
check_memory() {
    echo "🔹 Checking Memory usage..."
    free -h | awk '/^Mem:/ {print "Used: "$3 " / Total: "$2 " (" $3/$2*100 "% )"}'
    echo
}

# ----------------------------
# Function: Disk Usage Check
# ----------------------------
check_disk() {
    echo "🔹 Checking Disk usage..."
    df -h --output=source,pcent,target | grep -vE '^tmpfs|^udev'
    echo
}

# ----------------------------
# Main Function
# ----------------------------
main() {
    echo "=================================="
    echo "   🩺 System Health Check Report"
    echo "=================================="
    check_cpu
    check_memory
    check_disk
    echo "✅ Health check complete!"
}

# Run main function
main
