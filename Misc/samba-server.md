To share files over a network from an Ubuntu desktop, you can use various methods, depending on your specific needs. The most common options are using **Samba (SMB)** for sharing files with Windows and Linux users, **NFS** for sharing with Linux systems, or **SSH/SFTP** for secure file sharing.

Here’s how to do it step by step for each method:

### **1. Using Samba (SMB) for File Sharing (Windows and Linux)**

Samba allows sharing files with both Linux and Windows systems.

#### **Install Samba:**
1. Open a terminal and install Samba by running:
   ```bash
   sudo apt update
   sudo apt install samba
   ```

#### **Configure Samba:**
2. Create a directory you want to share:
   ```bash
   mkdir ~/shared
   ```

3. Change permissions to allow sharing (optional, if you want public access):
   ```bash
   sudo chmod -R 777 ~/shared
   ```

4. Edit the Samba configuration file:
   ```bash
   sudo nano /etc/samba/smb.conf
   ```

5. Add the following lines at the bottom of the file to create a share:
   ```
   [SharedFiles]
   path = /home/your_username/shared
   available = yes
   valid users = your_username
   read only = no
   browsable = yes
   public = yes
   writable = yes
   ```
   - Replace `your_username` with your actual username.
   - Adjust `public` and `writable` depending on your needs.

6. Save and exit the file (`Ctrl+X`, `Y`, `Enter`).

#### **Create Samba User:**
7. Create a Samba user and password (this may be different from the system password):
   ```bash
   sudo smbpasswd -a your_username
   ```

#### **Restart Samba:**
8. Restart the Samba service for changes to take effect:
   ```bash
   sudo systemctl restart smbd
   ```

#### **Access Shared Folder:**
- **From Ubuntu/Linux:** Open the file manager and click on **Other Locations**. Enter `smb://your_ubuntu_ip_address/SharedFiles` in the address bar.
- **From Windows:** Open **File Explorer**, and in the address bar, type `\\your_ubuntu_ip_address\SharedFiles`.

---

### **2. Using NFS (Network File System) for Linux Systems**

NFS is typically used for sharing files between Linux systems.

#### **Install NFS Server:**
1. Install the NFS server package:
   ```bash
   sudo apt install nfs-kernel-server
   ```

#### **Create a Shared Directory:**
2. Create a directory to share:
   ```bash
   mkdir ~/shared
   ```

3. Set appropriate permissions (this will depend on who needs access):
   ```bash
   sudo chmod -R 755 ~/shared
   ```

#### **Configure NFS Exports:**
4. Edit the `/etc/exports` file to add your share:
   ```bash
   sudo nano /etc/exports
   ```

5. Add the following line:
   ```
   /home/your_username/shared *(rw,sync,no_subtree_check)
   ```
   - Replace `/home/your_username/shared` with your actual directory.
   - The `*` allows all clients to access, but you can restrict by IP, e.g., `192.168.1.0/24` for a specific network.

6. Save and exit the file.

#### **Start NFS Service:**
7. Restart the NFS service:
   ```bash
   sudo systemctl restart nfs-kernel-server
   ```

#### **Access NFS Share:**
- **On another Linux machine**, install NFS client tools:
  ```bash
  sudo apt install nfs-common
  ```
  
- Mount the NFS share:
  ```bash
  sudo mount your_ubuntu_ip_address:/home/your_username/shared /mnt
  ```
  Replace `your_ubuntu_ip_address` and `/mnt` with your actual IP address and desired mount point.

---

### **3. Using SSH/SFTP for Secure File Sharing**

If security is a concern, you can use SSH or SFTP to share files securely over the network.

#### **Install OpenSSH Server:**
1. Install the OpenSSH server on your Ubuntu machine:
   ```bash
   sudo apt install openssh-server
   ```

#### **Access Files via SFTP:**
2. Use an SFTP client like **FileZilla** or access via terminal from another machine:
   ```bash
   sftp your_username@your_ubuntu_ip_address
   ```

3. Navigate to the directory you want to access and use `get` or `put` to download or upload files.

For example:
```bash
sftp> get /path/to/remote/file /path/to/local/destination
sftp> put /path/to/local/file /path/to/remote/destination
```

#### **Access Files via SCP:**
Alternatively, you can use SCP (Secure Copy) to transfer files:
```bash
scp your_username@your_ubuntu_ip_address:/path/to/remote/file /path/to/local/destination
```

---

### **4. Sharing Files Using Simple HTTP Server (Temporary Sharing)**

For a quick, temporary way to share files over the network, you can use Python’s built-in HTTP server.

#### **Start HTTP Server:**
1. Open a terminal in the directory you want to share and run:
   ```bash
   python3 -m http.server
   ```

2. This will start a web server on port 8000. You can access it from any device on the network by visiting `http://your_ubuntu_ip_address:8000` in a browser.

---

### **Do's:**
- Use Samba for mixed environments (Linux and Windows).
- Use NFS for Linux-only networks to get the best performance.
- Use SSH/SFTP for secure file transfer.
- Set proper permissions on shared directories to avoid unauthorized access.

### **Don'ts:**
- Avoid using `chmod 777` for shared directories, as it gives full access to everyone.
- Don’t share sensitive directories without properly restricting access.

These methods should cover most file-sharing scenarios for Ubuntu in a networked environment. Let me know if you need more help!