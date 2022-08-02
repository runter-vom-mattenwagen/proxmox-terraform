variable "pool" {
  type    = string
  default = "CI-Test"
}

variable "ciuser" {
  type    = string
  default = "admin"
}

variable "cipassword" {
  type    = string
  default = "pa$$word"
}

variable "cidns" {
  type    = string
  default = "172.16.92.55"
}

# How the VM's name starts
variable "vm_prefix" {
  type    = string
  default = "tf"
}

variable "vm_cores" {
  type    = number
  default = 1
}

variable "vm_mem" {
  type    = number
  default = 512
}

variable "vm_size" {
  type    = string
  default = "5G"
}

variable "domain_name" {
  type    = string
  default = "fritz.box"
}

# Creates Ansible inventory if true
# look at local_file.tf to see what happens
variable "ansible_enabled" {
  type    = bool
  default = false
}

variable "vm_count" { type = number }
variable "pmx_template" { type = string }
variable "env_name" { type = string }
variable "ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc..."
}
