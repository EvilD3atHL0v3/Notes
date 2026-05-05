#!/bin/bash

LOGFILE="/media/sf_Files/attack.log"

# Fixed attacker (persistent brute force)
PERSISTENT_IP="192.168.100.50"

timestamp() {
  date +"%b %d %H:%M:%S"
}

rand_ip() {
  echo "$(shuf -i 100-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)"
}

echo "[+] Starting Attack Simulation..."

# -------------------------------
# Persistent brute force attacker
# -------------------------------
for i in {1..5}
do
  echo "$(timestamp) Failed password for root from $PERSISTENT_IP port 22 ssh2" >> $LOGFILE
  sleep 1
done

# -------------------------------
# Random brute force attackers
# -------------------------------
for i in {1..5}
do
  echo "$(timestamp) Failed password for admin from $(rand_ip) port 22 ssh2" >> $LOGFILE
  sleep 1
done

# -------------------------------
# Successful login (compromise)
# -------------------------------
echo "$(timestamp) Accepted password for admin from $PERSISTENT_IP port 22 ssh2" >> $LOGFILE

# -------------------------------
# Post-attack activity
# -------------------------------
echo "$(timestamp) User admin executed backdoor.sh" >> $LOGFILE
echo "$(timestamp) Outbound connection to 45.33.32.156:4444" >> $LOGFILE
echo "$(timestamp) User root privileges escalated" >> $LOGFILE

echo "[+] Attack Simulation Completed."
