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
