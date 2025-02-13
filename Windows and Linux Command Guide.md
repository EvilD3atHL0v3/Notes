# Windows and Linux Command Guide

## Windows Commands

### System Information and Diagnostics

- **View Command History**
  - `doskey /history`: Displays the current session's command history.
  - `type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt`: Shows the history of PowerShell commands executed by the user.

- **System Information**
  - `systeminfo`: Provides detailed configuration information about the computer and its operating system, including OS configuration, security information, product ID, and hardware properties.

- **Task Management**
  - `tasklist /v`: Displays a list of currently running processes on the system with detailed information, including process IDs and memory usage.

### Networking

- **Ping a Range of IP Addresses**
  - `for /L %a in (1,1,255) do @ping -n 1 -w 10 10.91.x.%a > nul && echo 10.91.x.%a is up!`: Pings IP addresses from `10.91.x.1` to `10.91.x.255` to check which are active.

### File and Text Searching

- **Search for a Keyword in All Files**
  - `findstr "keyword" *.*`: Searches for occurrences of "keyword" in all files in the current directory.

- **Find Specific Files**
  - `dir /s /b | findstr apple | findstr .txt`: Searches for `.txt` files containing "apple" in their names within the current directory and all subdirectories.

- **Search for Lines of Specific Length**
  - `findstr /r "^.{18}$" filename.txt`: Finds lines that are exactly 18 characters long in `filename.txt`.

- **Extract IP Addresses from a File**
  - `findstr /R "\<[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\>" HKLM.txt`: Extracts IP addresses from `HKLM.txt`.

- **Search for Executable Files**
  - `findstr /I "\.exe" sample.txt`: Finds lines containing ".exe" in `sample.txt`, case-insensitive.

### Credential Management

- **List Stored Credentials**
  - `cmdkey /list`: Displays a list of stored usernames and credentials.

- **Run a Program as Administrator**
  - `runas /savecred /user:admin cmd.exe`: Runs `cmd.exe` as the administrator user without prompting for a password, using saved credentials.

### Registry and Configuration

- **Query PuTTY Sessions for Proxy Settings**
  - `reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s`: Searches the PuTTY sessions in the registry for proxy settings.

- **Find Connection Strings in Configuration Files**
  - `findstr connectionString C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config`: Searches for connection strings in the specified web.config file.

### System Directories

- **Event Logs**
  - `C:\Windows\System32\winevt\Logs\`: Directory where Windows event logs are stored.

- **Hosts File**
  - `C:\Windows\System32\drivers\etc\`: Directory containing the hosts file and other network configuration files.

- **PowerShell History**
  - `C:\Users\{Username}\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt`: File storing the history of PowerShell commands executed by the user.

- **WinX Menu Shortcuts**
  - `C:\Users\{Username}\AppData\Local\Microsoft\Windows\WinX`: Directory containing shortcuts for the Win+X menu.

## Linux Commands

### Security and Authentication

- **Sudo Execution History**
  - `cat /var/log/auth.log* | grep -i COMMAND | tail`: Displays the most recent sudo commands executed on the system.

- **Bash History**
  - `cat ~/.bash_history`: Shows the command history of the current user.

- **File Access**
  - `cat ~/.viminfo`: Lists files recently accessed or edited using Vim.

### System Logs

- **View System Logs**
  - `cat /var/log/syslog* | head`: Displays the beginning of the system log files.
  - `cat /var/log/syslog* | tail`: Displays the end of the system log files.
  - `cat /var/log/syslog* | more`: Allows for paginated viewing of the system log files.
  - `cat /var/log/syslog* | less`: Allows for backward and forward navigation through the system log files.

- **View Authentication Logs**
  - `cat /var/log/auth.log* | head`: Displays the beginning of the authentication log files.

- **List Log Files**
  - `ls /var/log`: Lists all files in the `/var/log` directory.

### File and Text Searching

- **Recursive Text Search**
  - `grep -r "This" .`: Recursively searches for the string "This" in the current directory and all subdirectories.

- **Find Specific Files**
  - `find . -name "*.txt"`: Finds all `.txt` files in the current directory and its subdirectories.

- **Search for a File by Name**
  - `find / -name "more" 2>/dev/null`: Searches the entire filesystem for files named "more", suppressing error messages.

### Network Configuration

- **View Network Interfaces**
  - `cat /etc/network/interfaces`: Displays the network interfaces configuration.

