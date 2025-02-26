# Standard Operating Procedure (SOP)

## System Logs & Command History Collection

### **1. Purpose**

This SOP outlines the procedures for collecting system logs and command history on Windows, Linux, and macOS. The purpose is to ensure standardization in log collection for troubleshooting, security auditing, and compliance.

### **2. Scope**

This procedure applies to system administrators, security analysts, and IT support personnel responsible for monitoring and analyzing system activity.

---

## **3. Procedures**

### **A. Windows Log & Command History Collection**

#### **1. Collecting System Event Logs**

**Using Event Viewer:**

1. Open **Run** (Win + R) and type:
   ```powershell
   eventvwr.msc
   ```
2. Navigate to **Windows Logs** → Select **System**, **Security**, or **Application**.
3. Right-click the log and choose **Save All Events As...** to export.

**Using PowerShell:**
To get recent system logs:

```powershell
Get-EventLog -LogName System -Newest 50
```

To export logs:

```powershell
wevtutil epl System C:\Logs\SystemLog.evtx
```

**Log File Location:**
System event logs are stored in:

```plaintext
C:\Windows\System32\winevt\Logs
```

To manually access them:

1. Open **File Explorer** and navigate to `C:\Windows\System32\winevt\Logs`.
2. Copy the required `.evtx` log files for analysis.

#### **2. Retrieving CMD & PowerShell History**

**CMD Command History:**

```cmd
doskey /history > C:\Logs\cmd_history.txt
```

**PowerShell Command History:**

```powershell
Get-History | Out-File C:\Logs\powershell_history.txt
```

For persistent history:

```powershell
Get-Content (Get-PSReadLineOption).HistorySavePath
```

**PowerShell History File Location:**
Persistent PowerShell command history is stored in:

```plaintext
C:\Users\{Username}\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```

To manually access it:

1. Open **File Explorer** and navigate to `C:\Users\{Username}\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline`.
2. Open `ConsoleHost_history.txt` to view saved commands.

**Description of Commands:**

- `Get-History`: Displays the command history of the current PowerShell session.
- `Get-Content (Get-PSReadLineOption).HistorySavePath`: Retrieves the full history of PowerShell commands from the persistent history file.

---

### **B. Linux Log & Command History Collection**

#### **1. Collecting System Logs**

**Using Journalctl (Systemd Logs):**

1. Open a terminal.
2. To display logs for the last hour:
   ```bash
   journalctl --since "1 hour ago"
   ```
3. To save system logs to a file:
   ```bash
   journalctl > /var/log/full_system_log.log
   ```
4. To view real-time logs:
   ```bash
   journalctl -f
   ```
5. To check authentication logs:
   ```bash
   tail -n 50 /var/log/auth.log
   ```

**Log File Locations:**
- General system logs: `/var/log/syslog`
- Authentication logs: `/var/log/auth.log`
- Kernel logs: `/var/log/kern.log`
- Systemd logs (if applicable): `/var/log/journal/`

#### **2. Retrieving Bash/Zsh Command History**

1. Open a terminal.
2. To display Bash command history:
   ```bash
   history
   ```
3. To save Bash command history to a file:
   ```bash
   cat ~/.bash_history > /var/log/bash_history.log
   ```
4. To display Zsh command history:
   ```bash
   cat ~/.zsh_history
   ```
5. To save Zsh history to a file:
   ```bash
   cat ~/.zsh_history > /var/log/zsh_history.log
   ```

---

### **C. macOS Log & Command History Collection**

#### **1. Collecting System Logs**

**Using Log Utility:**

1. Open **Terminal** on macOS.
2. To display logs for the last hour that contain errors:
   ```bash
   log show --predicate 'eventMessage contains "error"' --last 1h
   ```
3. To export logs for further analysis:
   ```bash
   log show --last 24h > ~/logs/system_24h.log
   ```
4. To collect system-wide logs for diagnostic purposes:
   ```bash
   log collect --output ~/logs/system_diagnostic.log
   ```
5. To view real-time logs:
   ```bash
   log stream
   ```

**Log File Locations:**
- System logs: `/var/log/system.log`
- Application logs: `~/Library/Logs`
- Kernel logs: `/var/log/kernel.log`
- System diagnostic logs: `/var/log/DiagnosticMessages`

#### **2. Retrieving Terminal Command History**

**Bash/Zsh History:**

```bash
cat ~/.bash_history > ~/logs/bash_history.log
cat ~/.zsh_history > ~/logs/zsh_history.log
```

---

## **4. Log Retention & Storage**

1. Store collected logs in a secure directory (`C:\Logs\`, `/var/log/`, or `~/logs/`).
2. Implement log rotation to prevent excessive storage usage.
3. Encrypt sensitive logs before transfer or backup.

---

## **5. Security & Compliance**

- Ensure access control policies restrict unauthorized log access.
- Follow organizational policies for log retention and deletion.
- Logs should be reviewed regularly for anomalies.

### **6. Review & Update**

This SOP should be reviewed every **6 months** and updated as needed.

---

**End of SOP**

