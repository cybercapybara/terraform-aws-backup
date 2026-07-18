# terraform-aws-backup

Terraform module that manages [AWS
Backup](https://aws.amazon.com/backup/) resources. It creates a backup vault
and a backup plan whose rules are rendered from a list variable, giving a single
place to define scheduled, retained backups.

## Usage

```hcl
module "backup" {
  source = "github.com/cybercapybara/terraform-aws-backup"

  vault_name = "prod-vault"
  plan_name  = "prod-plan"

  rules = [
    {
      rule_name    = "daily"
      schedule     = "cron(0 5 * * ? *)"
      delete_after = 30
    }
  ]

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name          | Description                                             | Type                | Default   | Required |
|---------------|---------------------------------------------------------|---------------------|-----------|:--------:|
| `vault_name`  | Name of the backup vault.                               | `string`            | n/a       |   yes    |
| `kms_key_arn` | ARN of the KMS key used to encrypt backups.             | `string`            | `null`    |    no    |
| `plan_name`   | Name of the backup plan.                                | `string`            | n/a       |   yes    |
| `rules`       | List of backup rules that make up the plan.             | `list(object(...))` | n/a       |   yes    |
| `tags`        | Tags applied to the vault and plan.                     | `map(string)`       | `{}`      |    no    |

## Outputs

| Name           | Description                                        |
|----------------|----------------------------------------------------|
| `vault_id`     | Name of the backup vault.                          |
| `vault_arn`    | ARN of the backup vault.                           |
| `plan_id`      | ID of the backup plan.                             |
| `plan_arn`     | ARN of the backup plan.                            |
| `plan_version` | Unique version identifier of the backup plan.      |

## License

[MIT](LICENSE)
