resource "null_resource" "create_partition" {
#   triggers = {
#     instance_id = azurerm_linux_virtual_machine.vm.id
#     disk_id     = azurerm_managed_disk.disk.id
#   }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = azurerm_linux_virtual_machine.vm.public_ip_address
      user        = "azureuser"
      private_key = file("~/.ssh/id_rsa")
    }

    inline = [
      # Step 1: Find the disk by size (e.g., 3GB)
      "DISK=$(lsblk -o NAME,SIZE -b | grep '3221225472' | awk '{print $1}' | head -n 1)",
      "DISK_PATH=/dev/$DISK",

      # Step 2: Partition the disk
      "echo -e 'n\np\n1\n\n\nw' | sudo fdisk $DISK_PATH",

      # Step 3: Format the partition
      "sudo mkfs.ext4 ${DISK_PATH}1",

      # Step 4: Get the UUID of the partition
      "PARTITION_UUID=$(sudo blkid -s UUID -o value ${DISK_PATH}1)",

      # Step 5: Create the mount point
      "sudo mkdir -p /mnt/data",

      # Step 6: Mount the partition
      "sudo mount UUID=$PARTITION_UUID /mnt/data",

      # Step 7: Persist in /etc/fstab
      "echo \"UUID=$PARTITION_UUID /mnt/data ext4 defaults 0 0\" | sudo tee -a /etc/fstab",

      # Verify the mount
      "df -h"
    ]
  }
}
