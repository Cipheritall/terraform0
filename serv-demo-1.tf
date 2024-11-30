resource "proxmox_lxc" "ubuntu_container" {
    target_node = "sun"
    hostname = "ubuntu-24"
    ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
    password = "rootpassword123"
    vmid = "1312"
    
    // Resource limits
    memory = 2048
    swap = 1024
    cores = 4
    
    // Root disk
    rootfs {
        storage = "local-lvm"
        size = "10G"
    }
    
    // Network configuration
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
    }

    // Basic container settings
    unprivileged = true
    start = true
    onboot = true
}

// Outputs to display container information
output "container_ip" {
    description = "The IP address of the container"
    value = proxmox_lxc.ubuntu_container.network[0].ip
}

output "container_hostname" {
    description = "The hostname of the container"
    value = proxmox_lxc.ubuntu_container.hostname
}

output "container_id" {
    description = "The ID of the container"
    value = proxmox_lxc.ubuntu_container.vmid
}

output "container_credentials" {
    description = "Default login credentials"
    value = {
        root_password = "rootpassword123"
    }
}
