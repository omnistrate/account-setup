
# Deprecation notice

This repo will no longer be maintained, pls refer to https://github.com/omnistrate-oss/account-setup to get the latest version

# account-setup 

Terraform script to setup your account to provision your services

## Setup your AWS account for Omnistrate
### Please replace the `suffix-from-platform` with the ID shown on the create account config screen
```bash
cd aws
terraform init
TF_VAR_account_config_identity_id=<suffix-from-platform> terraform apply
```

## Setup your GCP account for Omnistrate
### Ensure the following services are enabled (please replace the `project-id` with your project ID)
- IAM Service Account Credentials API
https://console.cloud.google.com/apis/library/iamcredentials.googleapis.com?project=project-id
- Compute Engine APIs
https://console.cloud.google.com/apis/library/compute.googleapis.com?project=project-id
- Kubernetes Engine APIs
https://console.cloud.google.com/apis/library/container.googleapis.com?project=project-id

then run the following commands:

```bash
cd gcp
gcloud auth application-default login
terraform init
TF_VAR_project_id=<project-id> TF_VAR_project_number=<project-number> TF_VAR_account_config_identity_id=<suffix-from-platform> terraform apply
```
