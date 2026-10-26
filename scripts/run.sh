#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../terraform"
docker version
terraform version
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
