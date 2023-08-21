variable "prefix" {
  description = "The prefix should be used for all resources in this example"
}
variable "location" {
  description = "The Azure region in which all resources in this example should be created"
  default = "North Europe"
}
variable "username" {
  default = "udacity-vm-user"
  description = "Username to be used"
}
variable "password" {
  default = "Password@123456"
  description = "Password to be used"
}