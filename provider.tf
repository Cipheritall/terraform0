terraform {
    required_version = ">= 0.13.0"
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.3"
        }
    }

}

variable "proxmox_api_url" {
    type = string
}
variable "proxmox_api_id" {
    type = string
}
variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}


provider "proxmox" {
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_id
    pm_api_token_secret = var.proxmox_api_secret
     
    on_tls_insecure = true
}