#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../terraform"
terraform state list
terraform state show docker_container.task3
terraform output
docker ps --filter name=task3-terraform-nginx
PORT="$(terraform output -raw application_url | sed -E 's#.*:([0-9]+)$#\1#')"
curl --fail --show-error --silent --output /dev/null --write-out 'HTTP %{http_code}\n' "http://localhost:${PORT}"
