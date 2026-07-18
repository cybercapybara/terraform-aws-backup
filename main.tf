resource "aws_backup_vault" "this" {
  name        = var.vault_name
  kms_key_arn = var.kms_key_arn

  tags = var.tags
}

resource "aws_backup_plan" "this" {
  name = var.plan_name

  dynamic "rule" {
    for_each = var.rules
    content {
      rule_name         = rule.value.rule_name
      target_vault_name = aws_backup_vault.this.name
      schedule          = rule.value.schedule
      start_window      = rule.value.start_window
      completion_window = rule.value.completion_window

      lifecycle {
        cold_storage_after = rule.value.cold_storage_after
        delete_after       = rule.value.delete_after
      }
    }
  }

  tags = var.tags
}
