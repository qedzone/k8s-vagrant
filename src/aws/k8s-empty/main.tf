provider "aws" {
  region = var.region
}

locals {
  # adjust cluster lists based on your needs
  clusters = {
    cluster-empty1 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    # cluster-empty2 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty3 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty4 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty5 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty6 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty7 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty8 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty9 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty10 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty11 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty12 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty13 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty14 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty15 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty16 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty17 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
    # cluster-empty18 = {
    #   allowed_cidr_blocks = "0.0.0.0/0",
    # },
  }
}

resource "aws_key_pair" "main" {
  key_name   = var.ssh-key-name
  public_key = var.ssh-key
}

module "clusters" {
  for_each     = local.clusters
  source       = "./k8s_module"
  cluster-name = each.key

  az                  = var.az
  region              = var.region
  allowed-cidr-blocks = each.value.allowed_cidr_blocks

  ssh-key-name = var.ssh-key-name
  ssh-key-path = var.ssh-key-path
}
