# Export Terraform variable values to an Ansible var_file
resource "local_file" "ansible_inventory" {
  count           = var.ansible_enabled == true ? 1 : 0
  content         = <<-EOT
    # Generated by Terraform

    [${var.env_name}]
    %{for ansible_hostname in proxmox_vm_qemu.proxmox_vm_a.*.name~}
    ${ansible_hostname}
    %{endfor~}
    EOT
  filename        = "../../ansible/inventory/hosts_${var.env_name}"
  file_permission = "0660"
}