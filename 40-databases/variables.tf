variable "project" {
  default = "roboshop"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "bastion_tags" {
  type = map
  default = {}
}

variable "bastion_role_name" {
  type = string
  default = "RoboShopDevBastion"
}