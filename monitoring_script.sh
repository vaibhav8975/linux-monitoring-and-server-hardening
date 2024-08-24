#!/bin/bash

# Function to display the top 10 applications consuming the most CPU and memory
top_apps() {
  echo "Top 10 Applications by CPU and Memory Usage:"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
  echo ""
}

# Function to monitor network usage
network_monitor() {
  echo "Network Monitoring:"
  echo "Number of concurrent connections:"
  ss -s | grep "TCP:" | awk '{print "TCP Connections: " $2}'
  echo "Packet Drops:"
  netstat -s | grep -i "dropped" | grep -E 'segments|datagrams'
  echo "Network I/O (MB in/out):"
  ifconfig | awk '/RX packets/{printf "Received: %.2f MB\n", $5/1024/1024} /TX packets/{printf "Sent: %.2f MB\n", $5/1024/1024}'
  echo ""
}

# Function to monitor disk usage
disk_usage() {
  echo "Disk Usage:"
  df -h | awk 'NR==1 || $5+0 >= 80 {print}'
  echo ""
}

# Function to monitor system load
system_load() {
  echo "System Load:"
  uptime
  echo "CPU Usage Breakdown:"
  mpstat | awk '$3 ~ /CPU/ {for (i=1; i<=NF; i++) if ($i ~ /usr|sys|idl|wa/) index[$i]=i} $3 ~ /all/ {for (i in index) printf "%s: %.2f%% ", i, $(index[i])} END {print ""}'
  echo ""
}

# Function to monitor memory usage
memory_usage() {
  echo "Memory Usage:"
  free -h
  echo "Swap Memory Usage:"
  swapon --show
  echo ""
}

# Function to monitor processes
process_monitor() {
  echo "Process Monitoring:"
  echo "Number of active processes:"
  ps ax | wc -l
  echo "Top 5 Processes by CPU and Memory Usage:"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
  echo ""
}

# Function to monitor essential services
service_monitoring() {
  echo "Service Monitoring:"
  services=(sshd nginx apache2 iptables)
  for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
      echo "$service is running"
    else
      echo "$service is not running"
    fi
  done
  echo ""
}

# Display help message
display_help() {
  echo "Usage: $0 [option]"
  echo ""
  echo "Options:"
  echo "  -top       Display top 10 applications consuming the most CPU and memory"
  echo "  -network   Display network monitoring information"
  echo "  -disk      Display disk usage information"
  echo "  -load      Display system load and CPU usage breakdown"
  echo "  -memory    Display memory usage and swap usage"
  echo "  -process   Display process monitoring information"
  echo "  -services  Display status of essential services"
  echo "  -all       Display all monitoring information"
  echo "  -help      Display this help message"
  echo ""
}

# Check if no arguments were provided and display help
if [ "$#" -eq 0 ]; then
  display_help
  exit 1
fi

# Main script execution based on command-line arguments
case "$1" in
  -top)
    top_apps
    ;;
  -network)
    network_monitor
    ;;
  -disk)
    disk_usage
    ;;
  -load)
    system_load
    ;;
  -memory)
    memory_usage
    ;;
  -process)
    process_monitor
    ;;
  -services)
    service_monitoring
    ;;
  -all)
    top_apps
    network_monitor
    disk_usage
    system_load
    memory_usage
    process_monitor
    service_monitoring
    ;;
  -help)
    display_help
    ;;
  *)
    echo "Invalid option: $1"
    display_help
    exit 1
    ;;
esac
