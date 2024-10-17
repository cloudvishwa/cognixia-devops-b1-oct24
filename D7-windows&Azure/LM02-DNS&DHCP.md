Here's a detailed lab manual for Module 3 on DNS and DHCP configuration. This lab covers the following key areas:

1. **Overview of DNS**
2. **Configuring DNS Zones and Records**
3. **Installing and Managing DHCP**
4. **Configuring DHCP Scopes, Reservations, and Options**
5. **Advanced DNS and DHCP Topics:**
   - DNS Delegation
   - DHCP Failover
   - Dynamic DNS (DDNS)

### Prerequisites
- Windows Server 2019 installed and configured
- Administrative access to the server
- Basic understanding of networking concepts

## Lab Manual Outline

### Part 1: Overview of DNS

1. **DNS Overview**:
   - DNS (Domain Name System) translates human-readable domain names into IP addresses.
   - DNS consists of zones and records that help direct traffic to the appropriate servers on the network.

### Part 2: Configuring DNS Zones and Records

1. **Installing the DNS Server Role**:
   - Open **Server Manager**.
   - Click on **Manage** > **Add Roles and Features**.
   - Select **Role-based or feature-based installation**.
   - Choose the server you want to install the DNS role on and click **Next**.
   - Select **DNS Server** and click **Next** through the prompts to install it.

2. **Creating a Forward Lookup Zone**:
   - Open the **DNS Manager** from the **Server Manager**.
   - Right-click on **Forward Lookup Zones** and select **New Zone**.
   - Follow the wizard to create a **Primary Zone** and give it a name (e.g., `example.com`).
   - Finish the wizard with default settings.

3. **Adding DNS Records**:
   - Right-click on the new zone (`example.com`) and select **New Host (A or AAAA)**.
   - Enter the hostname (e.g., `www`) and its corresponding IP address.
   - Click **Add Host** to create the DNS record.

4. **Creating a Reverse Lookup Zone**:
   - Right-click on **Reverse Lookup Zones** and select **New Zone**.
   - Follow the wizard to create a **Primary Zone** and enter the network ID.
   - Complete the wizard to create the reverse lookup zone.

### Part 3: Installing and Managing DHCP

1. **Installing the DHCP Server Role**:
   - Open **Server Manager**.
   - Click on **Manage** > **Add Roles and Features**.
   - Select **Role-based or feature-based installation**.
   - Choose the server and then select **DHCP Server**.
   - Follow the prompts to install the DHCP role.

2. **Post-Installation Configuration**:
   - Open **DHCP Manager** and click on the server name.
   - Right-click and choose **Authorize** to activate the DHCP server.
   - Once authorized, the DHCP server can manage IP address allocations on the network.

### Part 4: Configuring DHCP Scopes, Reservations, and Options

1. **Creating a DHCP Scope**:
   - Open the **DHCP Manager**.
   - Right-click on **IPv4** and select **New Scope**.
   - Follow the wizard to enter details like the scope name, starting IP address, ending IP address, subnet mask, and lease duration.
   - Configure DHCP options like **default gateway**, **DNS server**, and **WINS server**.

2. **Creating Reservations**:
   - Within the created DHCP scope, right-click on **Reservations** and choose **New Reservation**.
   - Enter a **Reservation Name**, **IP Address**, **MAC Address** of the client device, and choose the appropriate **support type** (DHCP or BOOTP).
   - Click **Add** to save the reservation.

3. **Configuring DHCP Options**:
   - Right-click on the DHCP server or scope and select **Set Predefined Options**.
   - Add options like **003 Router**, **006 DNS Servers**, or other custom options as needed.

### Part 5: Advanced DNS and DHCP Topics

#### 1. **DNS Delegation**
   - **DNS Delegation** is used when you delegate a part of a DNS namespace to another DNS server.
   - To create a delegation, right-click on the DNS zone and select **New Delegation**.
   - Specify the **domain name** to delegate and the **DNS server** that will manage the delegated domain.

#### 2. **DHCP Failover Configuration**
   - Open the **DHCP Manager**.
   - Right-click on the DHCP scope and select **Configure Failover**.
   - Select the partner server and configure options like **Load Balancing** or **Hot Standby**.
   - Finish the configuration to enable DHCP failover, ensuring high availability.

#### 3. **Dynamic DNS (DDNS) Configuration**
   - DDNS allows DHCP to automatically update DNS records.
   - Open the **DHCP Manager**, right-click on the server, and go to **Properties**.
   - Under the **DNS** tab, enable the option to **Automatically update DNS records** based on the client’s DHCP lease.
   - Configure the option to **Always update DNS records** for both new and existing DHCP clients.

### Lab Testing and Verification

1. **Test DNS Configuration**:
   - Open the command prompt on a client machine.
   - Use the command `nslookup <hostname>` to check if the DNS resolution works.
   - Verify that the correct IP address is returned.

2. **Test DHCP Configuration**:
   - Release and renew the IP address on a client using the command:
     ```
     ipconfig /release
     ipconfig /renew
     ```
   - Check that the client receives an IP address from the configured DHCP scope.

3. **Verify Failover**:
   - Simulate a failover scenario by disabling the primary DHCP server.
   - Ensure that the secondary server takes over the DHCP operations smoothly.

### Additional Tips
- **Backup Configurations**: Always back up your DNS and DHCP settings regularly.
- **Monitor Logs**: Keep track of the event logs for any issues related to DNS and DHCP operations.
- **Security**: Ensure DNS and DHCP are secured by implementing firewall rules and using secure dynamic updates.

This lab manual should help you configure DNS and DHCP on Windows Server 2019, covering both basic and advanced topics to ensure a robust setup.