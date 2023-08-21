#!/bin/bash
local dotenv_path=".env"
if [ ! -f "$dotenv_path" ]; then
    echo "$dotenv_path file not found."
    return 1
fi
export $(grep -v '^#' $dotenv_path | xargs)
az login --service-principal --username $appId \
    --password $appSecret \
    --tenant $tenantId