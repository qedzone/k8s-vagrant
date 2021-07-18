# Terraform aws module

Check the following quotas in aws/eu-west-1 (default):
- Running On-Demand Standard (A, C, D, H, I, M, R, T, Z) instances --> 220
- EC2-VPC Elastic IPs --> 20


# Useful terraform commands

- for module initialisation:

```terraform
terraform init
```

- for refresh only:

```terraform
terraform apply -refresh-only
```

- for increasing parallelism (defaults to 10):

```terraform
terraform apply -parallelism=30
```

- for handling a single cluster:

```terraform
terraform plan -target=module.clusters[\"cluster1\"]
terraform apply -target=module.clusters[\"cluster1\"]
terraform destroy -target=module.clusters[\"cluster1\"]
```
