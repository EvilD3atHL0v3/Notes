#!/bin/bash

LOGFILE="/media/sf_File/Logs/attack.log"
TARGET_USER="admin"

# Persistent attackers (VERY IMPORTANT)
ATTACKER1="45.67.89.10"
ATTACKER2="103.21.44.55"
ATTACKER3="198.51.100.23"

echo "[+] Starting Advanced Multi-Attack Simulation..."

sleep 1

# Function: Generate random IP
rand_ip() {
  echo "$(shuf -i 100-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)"
}

# Function: Timestamp
timestamp() {
  date +"%b %d %H:%M:%S"
}

# -------------------------------
# Brute Force (Persistent + Random)
# -------------------------------
echo "[*] Simulating Brute Force..."
for i in {1..5}
do
  echo "$(timestamp): Failed password for root from $ATTACKER1" >> $LOGFILE
  echo "$(timestamp): Failed password for admin from $ATTACKER2" >> $LOGFILE
  echo "$(timestamp): Failed password for guest from $ATTACKER3" >> $LOGFILE
  echo "$(timestamp): Failed password for root from $(rand_ip)" >> $LOGFILE
  sleep 1
done

# -------------------------------
# Credential Stuffing Pattern
# -------------------------------
echo "[*] Simulating Credential Stuffing..."
for user in admin root guest test
do
  echo "$(timestamp): Failed password for $user from $ATTACKER1" >> $LOGFILE
done

# -------------------------------
# Phishing
# -------------------------------
echo "[*] Simulating Phishing..."
echo "$(timestamp): User received phishing email with malicious link" >> $LOGFILE

# -------------------------------
# Malware / Ransomware
# -------------------------------
echo "[*] Simulating Malware..."
echo "$(timestamp): User $TARGET_USER downloaded file ransomware.exe" >> $LOGFILE
echo "$(timestamp): File ransomware.exe executed" >> $LOGFILE
echo "$(timestamp): Files encrypted by ransomware process" >> $LOGFILE

# -------------------------------
# Fileless Malware / Spyware
# -------------------------------
echo "[*] Simulating Fileless Malware..."
echo "$(timestamp): Suspicious PowerShell command executed in memory" >> $LOGFILE
echo "$(timestamp): Keylogging activity detected (spyware)" >> $LOGFILE

# -------------------------------
# SQL Injection
# -------------------------------
echo "[*] Simulating SQL Injection..."
echo "$(timestamp): SQL Injection attempt detected ' OR 1=1 -- from $ATTACKER2" >> $LOGFILE

# -------------------------------
# MITM + DNS Spoofing
# -------------------------------
echo "[*] Simulating MITM & DNS Spoofing..."
echo "$(timestamp): Possible MITM attack detected from $ATTACKER3" >> $LOGFILE
echo "$(timestamp): DNS response altered for bank.com to $(rand_ip)" >> $LOGFILE

# -------------------------------
# DoS / Botnet Attack
# -------------------------------
echo "[*] Simulating DoS / Botnet..."
for i in {1..5}
do
  echo "$(timestamp): High traffic detected from botnet node $ATTACKER1" >> $LOGFILE
done

# -------------------------------
# Backdoor
# -------------------------------
echo "[*] Simulating Backdoor..."
echo "$(timestamp): User $TARGET_USER executed backdoor.sh" >> $LOGFILE
echo "$(timestamp): Backdoor connection established to $ATTACKER2:4444" >> $LOGFILE

# -------------------------------
# Privilege Escalation
# -------------------------------
echo "[*] Simulating Privilege Escalation..."
echo "$(timestamp): User root privileges escalated" >> $LOGFILE
echo "$(timestamp): File /etc/shadow accessed" >> $LOGFILE

# -------------------------------
# Data Exfiltration
# -------------------------------
echo "[*] Simulating Data Exfiltration..."
echo "$(timestamp): Large outbound transfer to $ATTACKER3:8080 detected" >> $LOGFILE

# -------------------------------
# Insider Threat
# -------------------------------
echo "[*] Simulating Insider Threat..."
echo "$(timestamp): User john accessed confidential file payroll.xlsx" >> $LOGFILE
echo "$(timestamp): User john copied data to external device" >> $LOGFILE

# -------------------------------
# Supply Chain Attack
# -------------------------------
echo "[*] Simulating Supply Chain..."
echo "$(timestamp): Third-party software update installed with malicious payload" >> $LOGFILE

# -------------------------------
# Zero-Day Attack
# -------------------------------
echo "[*] Simulating Zero-Day..."
echo "$(timestamp): Unknown exploit behavior detected in system process" >> $LOGFILE

# -------------------------------
# Final Compromise
# -------------------------------
echo "[*] Simulating Account Takeover..."
echo "$(timestamp): Accepted password for $TARGET_USER from $ATTACKER1" >> $LOGFILE

echo "[+] Advanced Attack Simulation Completed."
