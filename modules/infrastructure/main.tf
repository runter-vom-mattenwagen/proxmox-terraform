terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://pve.fritz.box:8006/api2/json"
  pm_user         = "terraform@pam"
  pm_password     = "terraform"
  pm_tls_insecure = "true"

}
