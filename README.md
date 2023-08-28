# IIKG3005_InfrastructureAsCode
Project repo for the Infrastructure As Code class at NTNU

## How-tos:

### Connecting via terminal
1. Rename 'temp_dotEnv.txt' to '.env'
2. Make sure your '.gitignore' file includes '.env'
3. Fill out the '.env' file.
4. Run one of the connection scripts below

With bash: ```. /path/to/connect_az_cli.sh```

With powershell core:```. /path/to/connect-Azure.ps1```

### Letting Terraform connect directly
1. rename 'secrets_auto_tfvars.txt' to 'secrets.auto.tfvars'
2. make sure your '.gitignore' file includes 'secrets.auto.tfvars' or '*.auto.tfvars'
3. Terraform plan/apply
