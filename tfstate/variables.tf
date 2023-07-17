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
  default     = "rpaazure"
  description = "groups stages into logical context"
}

variable "stage" {
  default     = "dev"
  description = "stage name for the current context"
}