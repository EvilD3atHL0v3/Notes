# Activity 5b: Encrypted Cyber Threat Investigation Challenge
### Using Kleopatra and Gpg4win

---

## Activity Objective

At the end of this activity, learners should be able to:

- Download encrypted cybersecurity files
- Import OpenPGP public keys
- Decrypt secure incident reports
- Analyze cyber threat scenarios
- Generate personal public/private keys
- Encrypt investigation responses
- Practice secure SOC communication

---

# Scenario

You are a **Cyber Threat Monitoring Analyst** assigned in a **Security Operations Center (SOC)**.

A confidential cyber incident report has been uploaded to GitHub by the SOC Manager.

Your task is to:

- Download the encrypted incident file
- Import the SOC Manager’s public key
- Decrypt the incident report
- Investigate the cyber threat scenario
- Create your own OpenPGP key pair
- Encrypt your response
- Submit your encrypted investigation report

---

# GitHub Repository

Students will download the activity files here:

https://github.com/xen0byt3/Incident-Case-01

---

# Files Included

### `incident_case_01.gpg`
Encrypted cyber incident report

### `incident-case-01_0x8CED2682E692F6E3_public.asc`
SOC Manager public key

### Password

```text
4dm!n123
```

---

# [PART 1] Download Activity Files

## 1. Open GitHub Repository

Go to the **Incident Case 01 Repository**.

---

## 2. Download Files

Download the following:

- Encrypted incident file
- Public key file

You may choose either method below:

### Option A — Download ZIP

1. Click **CODE**
2. Select **Download ZIP**

### Option B — GitHub CLI

```bash
gh repo clone xen0byt3/Incident-Case-01
```

---

## 3. Save the Files

Save all downloaded files inside:

```text
Documents\CyberThreatMonitoring\
```

---

# [PART 2] Import Public Key

## 4. Open Kleopatra

Launch **Kleopatra** from your computer.

---

## 5. Import Public Key

1. Click **Import**
2. Select:

```text
incident-case-01_0x8CED2682E692F6E3_public.asc
```

3. Click **Open**

### Expected Result

```text
Certificate imported successfully
```

---

# [PART 3] Decrypt Incident File

## 6. Decrypt File

1. Right-click:

```text
incident_case_01.gpg
```

2. Select:

```text
More GpgEX options
```

3. Click:

```text
Decrypt and Verify
```

4. Enter the passphrase if required.

---

## 7. Open Decrypted Incident Report

Open and review the decrypted cyber incident report.

---

# [PART 4] Investigate the Incident

## 8. Create Investigation Response

Create a file named:

```text
student_response_case01.txt
```

Answer all questions based on your investigation.

---

## Example Format

```text
1. Summary of Findings:
The investigation identified suspicious login attempts originating from multiple unknown IP addresses targeting privileged accounts.

2. Indicators Observed:
- Multiple failed authentication attempts
- Unusual login timestamps
- Suspicious external IP addresses

3. Immediate Actions:
- Isolated affected systems
- Reset compromised credentials
- Escalated the incident to the SOC Team

4. Severity Level:
HIGH

5. Recommendation:
Implement multi-factor authentication (MFA) and strengthen account monitoring policies.
```

> Note: The example above is only a guide. Make your investigation response formal and professional.

---

# [PART 5] Create Student OpenPGP Key

## 9. Generate Student Key Pair

Inside Kleopatra:

1. Click **New Key Pair**
2. Select:

```text
Create Personal OpenPGP Key Pair
```

3. Enter the following:
   - Full Name
   - Email Address
   - Strong Passphrase

---

# [PART 6] Export Student Public Key

## 10. Export Public Key

1. Right-click your student certificate
2. Select **Export**

Save the file as:

```text
lastname_firstname_public.asc
```

---

# [PART 7] Encrypt Investigation Response

## 11. Encrypt Response File

Encrypt:

```text
student_response_case01.txt
```

### Output Example

```text
student_response_case01.txt.gpg
```

---

# [PART 8] Submit the Following

Students must submit:

### `lastname_firstname_public.asc`
Your public key

### `student_response_case01.txt.gpg`
Encrypted investigation response

---

# Submission Guidelines

Choose one of the following submission methods:

---

## Option 1 (Recommended)

Upload the following files to your GitHub repository:

- `lastname_firstname_public.asc`
- `student_response_case01.txt.gpg`

Then add:

```text
EvilD3atHL0v3
```

as a collaborator.

---

## Option 2 (Most Recommended)

Create a **Pull Request** on:

```text
incident-case-01.txt
```

containing your:

```text
student_response_case01.txt.gpg
```

---

# Video Tutorial

https://www.youtube.com/watch?v=2Zb216ONG14
