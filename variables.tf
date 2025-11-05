# General
variable "name" {
  type        = string
  description = "Name of the resource"
}

variable "kms_encription" {
  type        = bool
  default     = false
  description = "Enable KMS encryption"
}

# Other
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tag for all resources"
}
