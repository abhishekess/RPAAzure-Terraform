variable "ARM_SUBSCRIPTION_ID" {
  default = "REPLACE_ME"
}

variable "ARM_TENANT_ID" {
  default = "REPLACE_ME"
}


variable "resource_location" {
  type        = string
  default     = "Central India"
  description = "Location of the resource group."
}

variable "context" {
  type        = string
  default     = "rpaazure"
  description = "Application name"
}

variable "stage" {
  type        = string
  default     = "dev"
  description = "Application stage name"
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}
