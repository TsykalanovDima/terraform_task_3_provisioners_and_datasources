variable "prefix" {
  description = "Prefix used for naming Azure resources."
  type        = string
  default     = "tfvmex"
}

variable "resource_group_name" {
  description = "Name of the manually created Azure resource group."
  type        = string
  default     = "tfvmex-resources"
}

variable "admin_username" {
  description = "Administrator username for the virtual machine."
  type        = string
  default     = "testadmin"
}

variable "admin_password" {
  description = "Administrator password for the virtual machine."
  type        = string
  sensitive   = true
  default     = "Password1234!"
}

variable "virtual_network_name" {
  description = "Name of the existing virtual network."
  type        = string
  default     = "tfvmex-network"
}

variable "subnet_name" {
  description = "Name of the existing subnet."
  type        = string
  default     = "internal"
}

variable "network_interface_name" {
  description = "Name of the existing network interface."
  type        = string
  default     = "tfvmex-nic"
}

variable "virtual_machine_name" {
  description = "Name of the existing virtual machine."
  type        = string
  default     = "tfvmex-vm"
}

variable "public_ip_name" {
  description = "Name of the existing public IP address attached to the VM."
  type        = string
  default     = "tfvmex-public-ip"
}
