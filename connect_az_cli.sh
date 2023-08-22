#!/bin/bash
local dotenv_path=".env"
if [ ! -f "$dotenv_path" ]; then
    echo "$dotenv_path file not found."
    return 1
fi
export $(grep -v '^#' $dotenv_path | xargs)
az login --service-principal --username $ARM_CLIENT_ID \
    --password $ARM_CLIENT_SECRET \
    --tenant $ARM_TENANT_ID