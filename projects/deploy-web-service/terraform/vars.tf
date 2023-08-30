# Variables
variable "vm_count" {
  default = 2
}

variable "prefix" {
  description = "The prefix should be used for all resources in this example"
  default = "udacity-vm"
}

variable "location" {
  description = "The Azure region in which all resources in this example should be created"
  default = "North Europe"
}

variable "image-id" {
  default = "/subscriptions/<subscription_ID>/resourceGroups/UDACITY-RG/providers/Microsoft.Compute/images/udacityPackerImage"
  description = "The ID of the image to use for the virtual machine"
}

variable "image-name" {
  default = "udacityPackerImage"
  description = "The name of the image to use for the virtual machine"
}

variable "admin_username" {
  default = "udacityAdmin"
  description = "The username of the local administrator to create on the virtual machine"
}

variable "admin_password" {
  default = "udacityAdminPassword123!"
}