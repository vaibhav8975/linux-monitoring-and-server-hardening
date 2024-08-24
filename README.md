# linux-monitoring-and-server-hardening

# Linux Monitoring Dashboard

This script provides a real-time monitoring dashboard for Linux servers, including CPU, memory, network, disk, load, processes, and service monitoring.

## Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/vaibhav8975/linux-monitoring-and-server-hardening.git
cd linux-monitoring-dashboard
chmod +x monitoring_dashboard.sh


# System Monitoring Script

## Overview

This Bash script is designed to monitor and report various aspects of system performance. It provides detailed information about CPU and memory usage, network activity, disk usage, system load, memory and swap usage, process statistics, and the status of essential services. The script allows users to view these details through different command-line options.

## Features

- **Top Applications:** Shows the top 10 applications using the most CPU and memory.
- **Network Monitoring:** Reports on network connections, packet drops, and network I/O.
- **Disk Usage:** Displays disk usage statistics and highlights filesystems with high usage.
- **System Load:** Provides system load statistics and a breakdown of CPU usage.
- **Memory Usage:** Provides details on memory and swap usage.
- **Process Monitoring:** Lists the number of active processes and the top 5 processes by CPU and memory usage.
- **Service Monitoring:** Checks and reports the status of essential services.
- **All Information:** Displays all the above monitoring information at once.

## Usage

To use the script, run it with one of the following options:

- `-top`: Display the top 10 applications by CPU and memory usage.
- `-network`: Display network monitoring information.
- `-disk`: Display disk usage information.
- `-load`: Display system load and CPU usage breakdown.
- `-memory`: Display memory usage and swap usage.
- `-process`: Display process monitoring information.
- `-services`: Display the status of essential services.
- `-all`: Display all monitoring information.
- `-help`: Display the help message with usage instructions.

### Example Commands

1. **Display Top 10 Applications:**

    ```bash
    ./monitoring_script.sh -top
    ```

    *This command will show the top 10 applications consuming the most CPU and memory.*

2. **Monitor Network Activity:**

    ```bash
    ./monitoring_script.sh -network
    ```

    *This command provides information on network connections, packet drops, and network I/O in MB.*

3. **Check Disk Usage:**

    ```bash
    ./monitoring_script.sh -disk
    ```

    *This command displays disk usage statistics and highlights filesystems with usage over 80%.*

4. **View System Load:**

    ```bash
    ./monitoring_script.sh -load
    ```

    *This command provides the system load and a breakdown of CPU usage.*

5. **Get Memory Usage Information:**

    ```bash
    ./monitoring_script.sh -memory
    ```

    *This command displays memory and swap usage details.*

6. **Monitor Processes:**

    ```bash
    ./monitoring_script.sh -process
    ```

    *This command lists the number of active processes and the top 5 by CPU and memory usage.*

7. **Check Essential Services:**

    ```bash
    ./monitoring_script.sh -services
    ```

    *This command checks and reports the status of essential services such as `sshd`, `nginx`, `apache2`, and `iptables`.*

8. **Display All Monitoring Information:**

    ```bash
    ./monitoring_script.sh -all
    ```

    *This command displays all monitoring information, including CPU and memory usage, network activity, disk usage, system load, memory usage, process statistics, and the status of essential services.*

9. **Display Help Message:**

    ```bash
    ./monitoring_script.sh -help
    ```

    *This command displays the help message with usage instructions.*

## Script Functions

### `top_apps()`
Displays the top 10 applications consuming the most CPU and memory.

### `network_monitor()`
Provides network monitoring details including concurrent connections, packet drops, and network I/O.

### `disk_usage()`
Shows disk usage statistics and highlights filesystems with usage over 80%.

### `system_load()`
Displays system load and a breakdown of CPU usage.

### `memory_usage()`
Provides information on memory and swap usage.

### `process_monitor()`
Lists the number of active processes and the top 5 processes by CPU and memory usage.

### `service_monitoring()`
Checks the status of essential services like `sshd`, `nginx`, `apache2`, and `iptables`.

### `display_help()`
Shows the help message with usage instructions.


## Contributing

Contributions are welcome! Please submit issues or pull requests to enhance the script or address any bugs.

# Security Audit and Hardening Script

## Overview

This Bash script automates the process of performing a security audit and applying server hardening measures on Linux servers. It provides functionalities for listing users and groups, checking for critical security issues, scanning for vulnerabilities, and applying hardening measures. The script offers options for generating a comprehensive security report and configuring server security settings.

## Features

- **List Users and Groups:** Enumerates all users and groups on the server.
- **Check UID 0:** Identifies users with UID 0 (root privileges).
- **Check User Passwords:** Finds users without passwords or with weak passwords.
- **Scan World-Writable Files:** Searches for files and directories with world-writable permissions.
- **Check SSH Permissions:** Ensures that `.ssh` directories have secure permissions.
- **Report SUID/SGID Files:** Lists files with SUID or SGID bits set.
- **List Running Services:** Lists all currently running services.
- **Check Critical Services:** Verifies the status of critical services like `sshd` and `iptables`.
- **Check Firewall Status:** Reports on firewall status and open ports.
- **Check IP Configuration:** Displays IP configuration and identifies public vs. private IPs.
- **Check Security Updates:** Checks for available security updates.
- **Check Logs:** Reviews logs for suspicious activity.
- **Server Hardening:** Applies server hardening measures including SSH configuration, IPv6 disabling, GRUB bootloader security, and automatic security updates.
- **Generate Report:** Produces a summary report of the security audit.

## Usage

To use the script, run it with one of the following options:

- `--report`: Generate a comprehensive security audit report.
- `--hardening`: Apply server hardening measures.

### Example Commands

1. **Generate Security Audit Report:**

    ```bash
    ./security_script.sh --report
    ```

    This command will execute all audit functions and generate a summary report of the security status.

2. **Apply Server Hardening Measures:**

    ```bash
    ./security_script.sh --hardening
    ```

    This command will apply various hardening measures to enhance server security.

### Notes

- Ensure you have appropriate permissions to execute the script, especially for actions like checking firewall status, and modifying SSH configurations.
- The script might require root or sudo privileges to perform certain actions.

## Script Functions

### `list_users_groups()`
Lists all users and groups on the server.

### `check_uid_zero()`
Identifies users with UID 0 (root privileges).

### `check_user_passwords()`
Finds users without passwords or with weak passwords.

### `scan_world_writable()`
Scans for files and directories with world-writable permissions.

### `check_ssh_permissions()`
Ensures `.ssh` directories have secure permissions.

### `report_suid_sgid()`
Reports files with SUID or SGID bits set.

### `list_services()`
Lists all currently running services.

### `check_critical_services()`
Checks the status of critical services like `sshd` and `iptables`.

### `check_firewall_status()`
Reports on firewall status and configuration, and lists open ports.

### `check_ip_configuration()`
Displays IP configuration and identifies public vs. private IPs.

### `check_security_updates()`
Checks for available security updates.

### `check_logs()`
Reviews logs for suspicious activity.

### `server_hardening()`
Applies server hardening measures including SSH configuration, IPv6 disabling, GRUB security, and automatic updates.

### `generate_report()`
Generates a summary report of the security audit.

### `send_alert()`
(Optional) Sends an alert email if configured.

## Requirements

- The script should be run with appropriate permissions to access system tools and modify configurations.
- Ensure the following packages are installed: `awk`, `find`, `ls`, `systemctl`, `iptables`, `ss`, `ip`, `apt-get` or `yum`.

## License

This script is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please submit issues or pull requests to enhance the script or address any bugs.


