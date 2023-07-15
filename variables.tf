variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rpaazure-rg-"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "acr_name_prefix" {
  type        = string
  default     = "rpaazurecr"
  description = "Prefix of the container registry name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "cluster_name_prefix" {
  type        = string
  default     = "rpaazure-kc-"
  description = "Prefix of the cluster name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "dns_name_prefix" {
  type        = string
  default     = "rpaazure-dns-"
  description = "Prefix of the cluster dns name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}