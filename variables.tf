variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "kms_key_id" {
  type        = string
  description = "id of the kms key to encrypt the logs - defaults to null"
  default     = null
}

variable "log_group_suffix" {
  type        = string
  description = "log group name suffix that follows the stack name"
}

variable "retention_in_days" {
  type        = number
  description = "number of days to retain logs"
  default     = 90
}

variable "skip_destroy" {
  type        = bool
  description = "prevent terraform from destroying the log group"
  default     = true
}