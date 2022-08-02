resource "proxmox_vm_qemu" "proxmox_vm_a" {
  count       = var.vm_count
  name        = "${var.vm_prefix}-${var.env_name}-${count.index + 1}"
  desc        = "Generated with Terraform from ${var.pmx_template}"
  target_node = "pve"
  pool        = var.pool

  clone = var.pmx_template

  agent  = 1
  onboot = true

  cores  = var.vm_cores
  memory = var.vm_mem

  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = var.vm_size
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  os_type = "cloud-init"

  # Cloud Init Settings
  ipconfig0    = "ip=dhcp"
  ciuser       = var.ciuser
  cipassword   = var.cipassword
  searchdomain = var.domain_name
  nameserver   = var.cidns
  sshkeys      = var.ssh_key

}

output "instance_name" {
  value = proxmox_vm_qemu.proxmox_vm_a.*.name
}
