# General
variable "name" {
  type        = string
  description = "Name of the resource"
}

# Other
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tag for all resources"
}
