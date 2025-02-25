# System Administration Commands and File Paths

This document provides a categorized overview of essential file paths and command-line instructions for both Windows and Linux systems, aiding in system information retrieval, file searching, and command history access.
Windows

  ## Important File Paths

  ### Event Logs:
  - **Path:**   `C:\Windows\System32\winevt\Logs`
  - **Description:** This directory contains Windows Event Log files, which store records of system, security, and application events.

  ### System Configuration Files:
  - **Path:** `C:\Windows\System32\drivers\etc`
  - **Description:** Contains system configuration files, including the hosts file, which maps hostnames to IP addresses.

    ### PowerShell Command History:
    - **Path:** `C:\Users\{Username}\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt`
    - **Description:** Stores the history of commands entered in PowerShell for the specified user. Replace {Username} with your actual username.
    - **Powershell** `Get-History` or `Get-Content (Get-PSReadLineOption).HistorySavePath`

  ## Command-Line Instructions

  ### Command History: 
  - **Command:** `doskey /history`
  - **Description:** Displays the command history in the Command Prompt.

  ### System Information:
  - **Command:** `systeminfo`
  - **Description:** Provides detailed configuration information about the computer and its operating system.

  ### Task Management:
  - **Command:** `tasklist /v`
  - **Description:** Lists all running processes with detailed information.

  ### File Searching:
  - **Command:** `findstr /r "^.{18}$" filename.txt`
  - **Description:** Searches for lines in filename.txt that are exactly 18 characters long.
  - **Command:** `findstr /R "<[0-9][0-9].[0-9][0-9].[0-9][0-9].[0-9][0-9]>" HKLM.txt`
  - **Description:** Searches for patterns matching an IP-like format in HKLM.txt.
  - **Command:** `findstr /I ".exe" sample.txt`
  - **Description:** Case-insensitively searches for occurrences of ".exe" in sample.txt.
  - **Command:** `dir /s /b | findstr apple | findstr .txt`
   - **Description:** Recursively lists all files, filtering for those containing "apple" and ending with ".txt".

  ### Network Utilities:
  - **Command:** `for /L %a in (1,1,255) do @ping -n 1 -w 10 10.91.x.%a > null && echo 10.91.x.%a is up!`
  - **Description:** Pings a range of IP addresses to check their availability.

  ### Credential Management:
  - **Command:** `cmdkey /list`
  - **Description:** Lists saved Windows credentials.
  - **Command:** `runas /savecred /user:admin cmd.exe`
  - **Description:** Runs cmd.exe as the "admin" user, saving the credentials.

  ### IIS Configuration:
  - **Command:** `C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config | findstr connectionString`
  - **Description:** Searches for connection strings in the IIS web.config file.

  ### PuTTY Configuration:
  - **Command:** `reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy"`
  - **Description:** Queries the Windows registry for PuTTY session proxy settings.

# Linux
  ## Command-Line Instructions

  ### Command History:
  - **Command:** `cat ~/.bash_history`
  - **Description:** Displays the history of commands entered in the Bash shell.

    ### File Access:
    - **Command:** `cat ~/.viminfo`
    - **Description:** Shows the Vim editor's recent files and command history.

    ### Log Files:
    - **Command:** `cat /var/log/syslog* | head/tail/more/less`
    - **Description:** Views the beginning or end of system log files.
    - **Command:** `cat /var/log/auth.log* | head`
    - **Description:** Displays the beginning of authentication logs.
    - **Command:** `ls /var/log`
    - **Description:** Lists all files in the /var/log directory.

    ### File Searching:
    - **Command:** `grep -r "This" find . -name "*.txt"`
    - **Description:** Recursively searches for the string "This" in all .txt files.
    - **Command:** `find / -name "more" 2>/dev/null
    - **Description:** Searches the entire filesystem for files named "more", suppressing error messages.

    ### Network Configuration:
    - **Command:** `cat /etc/network/interfaces`
    - **Description:** Displays network interface configurations.

    ### Sudo Execution History:
    - **Command:** `cat /var/log/auth.log* | grep -i COMMAND | tail`
    - **Description:** Displays recent sudo command executions from the authentication logs.
