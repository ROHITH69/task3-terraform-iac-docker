# Task 3 — Infrastructure as Code (IaC) with Terraform

Provision a local Docker container using Terraform, following the supplied internship brief.

## Objective
Use Terraform and the Docker provider to create a local Docker container, inspect Terraform state, and destroy the infrastructure cleanly.

## Requirements
- Docker Engine/Desktop running locally
- Terraform CLI (1.5+ recommended)
- Internet access on first `terraform init` to download the provider and the container image

## Project layout
```text
terraform/
  versions.tf
  main.tf
  variables.tf
  outputs.tf
  terraform.tfvars.example
  .gitignore
scripts/
  run.sh
  verify.sh
  destroy.sh
logs/
  README.md
screenshots/
  README.md
```

## Quick start (macOS/Linux; run from the repository root)
1. Confirm tools:
   ```bash
   docker version
   terraform version
   ```
2. Enter the Terraform directory:
   ```bash
   cd terraform
   terraform init
   terraform fmt -check
   terraform validate
   terraform plan
   terraform apply
   ```
   Review the plan and type `yes` when prompted.
3. Verify:
   ```bash
   terraform state list
   terraform state show docker_container.task3
   terraform output
   docker ps --filter name=task3-terraform-nginx
   ```
4. Test the container:
   ```bash
   curl -I http://localhost:8088
   ```
   If port 8088 is already occupied, set another host port before apply, for example:
   ```bash
   terraform apply -var="host_port=8089"
   curl -I http://localhost:8089
   ```
5. Destroy resources when finished:
   ```bash
   terraform destroy
   terraform state list
   ```

## Important
- The container uses the official `nginx:alpine` image and maps host port 8088 to container port 80.
- Terraform state (`terraform.tfstate`) is local and intentionally excluded from Git because it can contain infrastructure details. Do not commit state, `.terraform/`, or secret `.tfvars` files.
- This project provisions a local container only; it does not create AWS/cloud resources or incur cloud charges.
- Execution logs are intentionally not fabricated. Save your real terminal output in `logs/` after running the commands. See `logs/README.md`.
- Do not commit credentials, tokens, passwords, state files, or provider cache directories.
