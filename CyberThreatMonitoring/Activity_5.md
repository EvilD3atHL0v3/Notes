# Activity #5: Installing Relevant Technologies for Cyber Threat Monitoring

## Objective
Set up essential cybersecurity tools and practice secure installation, verification, and Git-based workflow using Git and GitHub[cite: 1].

---

## Part 1: Download Required Tools
Before beginning the installation, download the following software:
* **Gpg4win:** [Download Here](https://gpg4win.org/download.html)
* **Git:** [Download Here](https://git-scm.com/)
* **GitHub CLI:** [Download Here](https://cli.github.com/)
* **GitHub Desktop (Optional):** [Download Here](https://desktop.github.com/download/)

---

## Part 2: Install Gpg4win & Verify Installer
**CRITICAL:** Always verify the integrity of security software before installation

### [Step 1] Install Gpg4win
1. Open the downloaded installer.
2. Click **Next** → **Install** → **Finish**.

### [Step 2] Verify Installer Using PowerShell
1. Open **PowerShell**.
2. Navigate to your Downloads folder:
   ```powershell
   cd $env:USERPROFILE\Downloads
   ```
3. Run the following command to generate the file hash:
   ```powershell
   Get-FileHash .\gpg4win-*.exe
   ```
4. Compare the output hash value with the SHA-256 fingerprint provided on the official Gpg4win website.
   * **Match:** File is safe to use.
   * **No Match:** Do NOT install; the file may be corrupted or tampered with.

---

## Part 3: Install Other Tools

### Git
1. Open the Git installer.
2. Click **Next** through the prompts (keeping default settings is recommended).
3. Click **Install** → **Finish**.

### GitHub CLI
1. Open the installer and follow the prompts: **Next** → **Install** → **Finish**.
2. Open Command Prompt or PowerShell and verify the installation:
   ```bash
   gh --version
   ```

### GitHub Desktop (Optional)
1. Open the installer.
2. Sign in using your GitHub account and follow the setup instructions[cite: 1].

---

## Part 4: Create Your Project Folder
1. Create a folder named following this format: `handleName-gitXsoc` (e.g., `EvilD3atHL0v3-gitXsoc`).
2. Inside the folder, create a file named `att4ck_l0g.txt`.
3. Paste the following log data into the file:
```text
Apr 06 09:10:12 Failed login for admin from 192.168.1.10
Apr 06 09:10:15 Failed login for root from 192.168.1.10
Apr 06 09:10:20 Failed login for user from 192.168.1.10
Apr 06 09:11:05 Successful login for admin from 192.168.1.10
Apr 06 09:11:30 Admin executed sudo command
Apr 06 09:12:10 Suspicious file uploaded to server
Apr 06 09:13:45 Connection to unknown IP 10.0.0.50
Apr 06 09:14:00 Possible data exfiltration detected
Apr 06 09:15:20 Antivirus disabled
Apr 06 09:16:00 System reboot initiated
```

---

## Part 5: Git Configuration
Open **Git Bash** inside your project folder and run the following:
```bash
git config --global user.name "Your Cybersecurity Handle"
git config --global user.email "your@email.com"
git config --list
```

---

## Part 6: Authenticate Using GitHub CLI
1. In your terminal, run:
   ```bash
   gh auth login
   ```
2. Follow these prompts:
   * **Account:** GitHub.com
   * **Protocol:** HTTPS
   * **Method:** Login with a web browser
3. Copy the one-time code provided in the terminal.
4. When the browser opens, paste the code and click **Authorize**.
5. You should see: `Authentication complete.`

---

## Part 7: Upload Your Project to GitHub

### 1. Initialize Local Repository
Right-click inside your folder → **Open Git Bash here**:
```bash
git init
git add .
git commit -m "Initial cyber attack log upload"
```

### 2. Create Repository Online
1. Go to GitHub and click **New Repository**.
2. **Repository name:** Use your folder name (e.g., `EvilD3atHL0v3-gitXsoc`).
3. **Important:** Do NOT check “Add README”.
4. Click **Create Repository**.

### 3. Connect & Push
```bash
git remote add origin https://github.com/yourusername/nameofproject.git
git branch -M main
git push -u origin main
```

### 4. Add Version Tag
```bash
git tag v1.0
git push origin v1.0
```

---

## Part 8: Update Files (Practice)
To practice the workflow, make a change and run:
```bash
git add .
git commit -m "Updated attack log"
git push
git status
```

---

## Part 9: Add Collaborator
1. On GitHub, go to your repository **Settings**.
2. Click **Collaborators** → **Add people**.
3. Enter: `EvilD3atHL0v3`
4. Send the invitation.

---

## Submission Requirements
Ensure you submit the following:
1.  **GitHub Repository Link**
2.  **Screenshot** of uploaded files in the repository
3.  **Proof** of successful push
```
