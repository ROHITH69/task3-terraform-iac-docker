# Execution logs

This directory is reserved for **real output from your own run**. Logs have not been fabricated.

After running commands, save terminal output here, for example:
```bash
cd terraform
terraform init 2>&1 | tee ../logs/terraform-init.log
terraform plan 2>&1 | tee ../logs/terraform-plan.log
terraform apply 2>&1 | tee ../logs/terraform-apply.log
terraform state list 2>&1 | tee ../logs/terraform-state-list.log
terraform destroy 2>&1 | tee ../logs/terraform-destroy.log
```
Run commands separately and review the plan before applying. Avoid capturing secrets in logs.
