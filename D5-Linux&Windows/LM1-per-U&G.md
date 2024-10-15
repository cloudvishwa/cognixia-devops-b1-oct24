Below is a comprehensive lab manual covering common Linux administrative tasks such as managing file permissions, users and groups, password policies, and welcome messages. Each section provides a scenario with a set of tasks, Do's and Don'ts to help guide the learning process.

---

### **Lab Manual: Linux File Permissions, Users, and Groups**

---

#### **1. File Permissions**

**Scenario:**  
You are tasked with managing file and directory permissions for a shared project directory that contains sensitive information. Your job is to set permissions correctly to ensure that only the required users have access.

**Tasks:**
1. Create a directory `/home/project/`.
2. Set the directory so that only the owner (you) and group members can read and write files in the directory, while others have no access.
3. Change the permissions of a file `secret.txt` inside `/home/project/` so that only you, the owner, have read/write access.

**Commands:**
```bash
mkdir /home/project
chmod 770 /home/project      # Owner and group have read, write, execute
chmod 600 /home/project/secret.txt  # Only owner has read/write
```

**Do's:**
- Ensure you use the correct permission mode (`chmod` 770 for the directory).
- Keep sensitive files (like `secret.txt`) secured with minimal access (owner only).

**Don'ts:**
- Do not set overly permissive permissions (e.g., `chmod 777`), as it opens up access to everyone.
- Avoid changing the ownership of system or root directories unless absolutely necessary.

---

#### **2. Users and Groups**

**Scenario:**  
You need to create new users and assign them to specific groups for managing access to a development project.

**Tasks:**
1. Create a new group called `developers`.
2. Create a user `alice` and add her to the `developers` group.
3. Verify that `alice` is part of the `developers` group.
4. Change the primary group of `alice` to `developers`.

**Commands:**
```bash
sudo groupadd developers
sudo useradd -m -G developers alice
sudo usermod -g developers alice
id alice  # To verify group membership
```

**Do's:**
- Always verify group assignments using `id username` to confirm.
- Use `-m` with `useradd` to create the home directory for the user.

**Don'ts:**
- Do not add users to sensitive groups (like `sudo`) unless absolutely required.
- Avoid using spaces in group names, as it can create confusion in scripts.

---

#### **3. Sticky Bit**

**Scenario:**  
You are managing a shared directory where multiple users are collaborating, but each user should only be able to delete their own files.

**Tasks:**
1. Create a directory `/home/shared/`.
2. Set the sticky bit on the directory to ensure users can only delete their own files.
3. Verify the sticky bit is correctly set.

**Commands:**
```bash
mkdir /home/shared
chmod 1777 /home/shared    # 1 before the permissions indicates the sticky bit
ls -ld /home/shared        # Verify sticky bit with 't' at the end
```

**Do's:**
- Use the sticky bit in shared directories to prevent accidental file deletions by other users.

**Don'ts:**
- Do not remove the sticky bit unless you understand the consequences (it removes restrictions on file deletions).

---

#### **4. Umask**

**Scenario:**  
You are setting up default file permissions for all new files and directories created by users to ensure they are not too permissive.

**Tasks:**
1. Set the `umask` value to `027` so that by default, files are created with `640` and directories with `750` permissions.
2. Verify the umask setting.

**Commands:**
```bash
umask 027  # Sets default file creation permissions
umask      # Verify current umask value
```

**Do's:**
- Always set a restrictive `umask` value for sensitive environments (e.g., `027`).

**Don'ts:**
- Avoid setting `umask` to `000`, as it allows full access to everyone (very insecure).

---

#### **5. Change Password Age**

**Scenario:**  
You need to enforce password expiration policies for security purposes, ensuring users regularly change their passwords.

**Tasks:**
1. Change the password expiration period for user `alice` to 30 days.
2. Set a warning for 7 days before password expiration.
3. Check the password expiration status of the user.

**Commands:**
```bash
sudo chage -M 30 alice    # Set password expiration to 30 days
sudo chage -W 7 alice     # Set warning period to 7 days
sudo chage -l alice       # List password aging information
```

**Do's:**
- Set realistic password expiration periods to enhance security.
- Inform users about upcoming password changes in advance (e.g., using the warning period).

**Don'ts:**
- Do not set a password expiration time that is too short, which can frustrate users.
- Avoid leaving critical accounts without password aging policies.

---

#### **6. Lock and Unlock User Accounts**

**Scenario:**  
You need to temporarily disable a user's account due to inactivity or a security issue, and later unlock it when needed.

**Tasks:**
1. Lock the user `bob`.
2. Unlock the user `bob` when required.

**Commands:**
```bash
sudo usermod -L bob    # Lock the user
sudo usermod -U bob    # Unlock the user
```

**Do's:**
- Use account locking when users are on leave or pose a security risk.

**Don'ts:**
- Do not delete accounts without proper authorization. Lock them instead for later review.

---

#### **7. Set a Welcome Message for Users**

**Scenario:**  
You want to display a custom message each time users log in to the system.

**Tasks:**
1. Set a welcome message that says “Welcome to the project system!” for all users.
2. Ensure the message is displayed every time a user logs in.

**Commands:**
1. Edit the `/etc/motd` file (Message of the Day):
   ```bash
   sudo nano /etc/motd
   ```
2. Add the message:
   ```
   Welcome to the project system!
   ```
3. Save the file.

**Do's:**
- Use `/etc/motd` for system-wide messages visible at login.
- Include helpful information (e.g., maintenance schedules) in the welcome message if relevant.

**Don'ts:**
- Do not clutter the login message with irrelevant or excessive information.

---

This lab manual provides a complete guide to handling basic Linux administration tasks with clear Do's and Don'ts to avoid common pitfalls. You can extend this to create hands-on practice scenarios to reinforce learning!