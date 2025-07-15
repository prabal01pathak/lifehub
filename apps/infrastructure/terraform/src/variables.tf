variable "resource_group_name" {}
variable "location" { default = "eastus" }

variable "vnet_cidr" { default = "10.0.0.0/8" }
variable "subnet_cidr" { default = "10.240.0.0/16" }

variable "aks_cluster_name" {}
variable "node_count" { default = 3 }
variable "client_id" {
  default = ""
}
variable "client_secret" { default = "" }

variable "tags" {
  type    = map(string)
  default = {
    environment = "dev"
    managed-by  = "terraform"
  }
}
