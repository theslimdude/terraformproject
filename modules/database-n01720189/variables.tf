variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "admin_username" {
  type        = string
}

variable "admin_password" {
  type        = string
}

variable "db_server_name" {
  type        = string
}

variable "db_sku_name" {
  type        = string
}

variable "db_version" {
  type        = string
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "anmol.dahal"
    ExpirationDate = "2025-12-31"
    Environment    = "Learning"
  }
}
