output "vault_id" {
  description = "Name of the backup vault."
  value       = aws_backup_vault.this.id
}

output "vault_arn" {
  description = "ARN of the backup vault."
  value       = aws_backup_vault.this.arn
}

output "plan_id" {
  description = "ID of the backup plan."
  value       = aws_backup_plan.this.id
}

output "plan_arn" {
  description = "ARN of the backup plan."
  value       = aws_backup_plan.this.arn
}

output "plan_version" {
  description = "Unique version identifier of the backup plan."
  value       = aws_backup_plan.this.version
}
