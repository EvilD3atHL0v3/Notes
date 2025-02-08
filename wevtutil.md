# Windows Event Utility (`wevtutil`) Guide

## **1. What is `wevtutil`?**
`wevtutil` (Windows Event Utility) is a command-line tool in Windows used to manage event logs. It allows administrators to query, export, and manipulate event logs efficiently.

### **Common Uses of `wevtutil`**
#### **1.1 Listing Event Logs**
```sh
wevtutil el
```
Lists all available event logs.

#### **1.2 Displaying Event Log Information**
```sh
wevtutil gl "System"
```
Shows details about a specific log.

#### **1.3 Querying Event Logs**
```sh
wevtutil qe System /c:10 /rd:true /f:text
```
Retrieves the last 10 events from the System log.

#### **1.4 Exporting Event Logs**
```sh
wevtutil epl Application C:\Logs\Application.evtx
```
Saves the Application event log to a file.

#### **1.5 Clearing an Event Log**
```sh
wevtutil cl Security
```
Clears the Security event log.

#### **1.6 Enabling or Disabling Event Logs**
```sh
wevtutil sl "Microsoft-Windows-Security-Auditing/Operational" /e:true
```
Enables a specific event log.

---

## **2. Querying Login Events**
### **2.1 Retrieve the Latest 10 Successful Logins (Event ID 4624)**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624)]]" /c:10 /f:text
```

### **2.2 Retrieve Failed Login Attempts (Event ID 4625)**
```sh
wevtutil qe Security /q:"*[System[(EventID=4625)]]" /c:10 /f:text
```

### **2.3 Retrieve All Login and Logoff Events**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624 or EventID=4634)]]" /c:10 /f:text
```

### **2.4 Retrieve Logins for a Specific User**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624)]] and *[EventData[Data[@Name='TargetUserName']='UserName']]" /c:5 /f:text
```
Replace `UserName` with the actual username.

### **2.5 Retrieve Login Attempts via Remote Desktop (RDP)**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624)]] and *[EventData[Data[@Name='LogonType']='10']]" /c:5 /f:text
```

---

## **3. Querying Events in a Specific Time Range**

### **3.1 Query Logins and Logoffs Between Two Specific Times**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624 or EventID=4634) and TimeCreated[@SystemTime >= '2024-02-07T10:00:00.000Z' and @SystemTime <= '2024-02-07T12:00:00.000Z']]]" /f:text
```

### **3.2 Retrieve Login/Logoff Events from the Last 2 Hours**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624 or EventID=4634) and TimeCreated[timediff(@SystemTime) <= 7200000]]]" /f:text
```
(7200000 milliseconds = 2 hours)

### **3.3 Query for a Specific User in a Time Range**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624 or EventID=4634) and TimeCreated[@SystemTime >= '2024-02-07T10:00:00.000Z' and @SystemTime <= '2024-02-07T12:00:00.000Z']]] and *[EventData[Data[@Name='TargetUserName']='johndoe']]" /f:text
```

### **3.4 Query for RDP (Remote Desktop) Logins in a Time Range**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624) and TimeCreated[@SystemTime >= '2024-02-07T10:00:00.000Z' and @SystemTime <= '2024-02-07T12:00:00.000Z']]] and *[EventData[Data[@Name='LogonType']='10']]" /f:text
```

### **3.5 Query by Time, Event Code, and Username**
```sh
wevtutil qe Security /q:"*[System[(EventID=4624 or EventID=4634) and TimeCreated[@SystemTime >= '2024-02-07T10:00:00.000Z' and @SystemTime <= '2024-02-07T12:00:00.000Z']]] and *[EventData[Data[@Name='TargetUserName']='UserName']]" /f:text
```
Replace `UserName` with the actual username.

### **3.6 Converting Local Time to UTC**
Windows event logs store time in **UTC (`Z` suffix)**, so convert your local time to UTC before using the query.

---

## **4. Querying Username and Password Events**
### **4.1 Query for Username Changes (Event ID 4781)**
```sh
wevtutil qe Security /q:"*[System[(EventID=4781)]]" /f:text
```
- This event occurs when a user's account name is changed.

### **4.2 Query for Password Changes (Event ID 4723, 4724)**
```sh
wevtutil qe Security /q:"*[System[(EventID=4723 or EventID=4724)]]" /f:text
```
- **4723**: A user attempted to change their own password.
- **4724**: An administrator reset a user’s password.

### **4.3 Query for Locked Out Accounts (Event ID 4740)**
```sh
wevtutil qe Security /q:"*[System[(EventID=4740)]]" /f:text
```
- This event occurs when a user account is locked out due to multiple failed login attempts.

---

## **5. Bonus: Using PowerShell for More Readable Output**
```powershell
Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4624 } | Select-Object -First 10
```
This provides a structured output for login events.

---
