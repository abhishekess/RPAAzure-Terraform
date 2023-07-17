variable "ARM_SUBSCRIPTION_ID" {
  default = "REPLACE_ME"
}

variable "ARM_TENANT_ID" {
  default = "REPLACE_ME"
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
