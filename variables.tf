variable "vault_name" {
  description = "Name of the backup vault."
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt backups in the vault. Null uses the default key."
  type        = string
  default     = null
}

variable "plan_name" {
  description = "Name of the backup plan."
  type        = string
}

variable "rules" {
  description = "List of backup rules that make up the plan."
  type = list(object({
    rule_name          = string
    schedule           = string
    start_window       = optional(number, 60)
    completion_window  = optional(number, 180)
    delete_after       = optional(number, 30)
    cold_storage_after = optional(number, null)
  }))

  validation {
    condition     = length(var.rules) > 0
    error_message = "At least one backup rule must be provided."
  }
}

variable "tags" {
  description = "Tags applied to the vault and plan."
  type        = map(string)
  default     = {}
}
