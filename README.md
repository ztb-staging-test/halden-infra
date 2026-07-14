# halden-infra

Terraform for Halden Freight Analytics' AWS production environment (eu-central-1).

> Demo repository. Halden Freight Analytics is a fictional company used to test
> ZeroTB's compliance engine. It contains deliberately planted misconfigurations and
> is never applied to a real AWS account.

## What's here

| File | Resources |
|---|---|
| `network.tf` | VPC, public/private subnets over two AZs, internet gateway |
| `storage.tf` | Private freight-data bucket (versioned, KMS-encrypted, public access blocked) |
| `exports.tf` | Report-exports bucket served to customers, 30-day expiry |
| `database.tf` | Shipments Postgres (RDS, encrypted, private) |
| `security_groups.tf` | App and DB security groups |
| `bastion.tf` | SSH jump host for on-call DB access |

State lives in `s3://halden-terraform-state` with DynamoDB locking.

## Usage

```sh
terraform init
terraform plan -out plan.bin
terraform apply plan.bin
```

Changes go through a pull request; paste the plan output into the PR description.

## License

MIT. Written from scratch for this demo.
