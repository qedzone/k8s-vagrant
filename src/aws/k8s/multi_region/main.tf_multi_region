provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  alias = "eu-west-1"
  region = "eu-west-1"
}

provider "aws" {
  alias = "eu-west-2"
  region = "eu-west-2"
}

locals {
  clusters_eu_central_1 = {
    cluster1 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster2 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster3 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster4 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster5 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
  }
  clusters_eu_west_1 = {
    cluster6 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster7 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster8 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster9 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster10 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
  }
  clusters_eu_west_2 = {
    cluster11 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster12 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster13 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster14 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    cluster15 = {
      allowed_cidr_blocks = "0.0.0.0/0",
    },
    //    cluster16 = {
    //      allowed_cidr_blocks = "0.0.0.0/0",
    //    },
  }
}

resource "aws_key_pair" "main" {
  key_name   = var.ssh-key-name
  public_key = var.ssh-key
}

resource "aws_key_pair" "main-eu-west-1" {
  provider = aws.eu-west-1
  key_name   = var.ssh-key-name
  public_key = var.ssh-key
}

resource "aws_key_pair" "main-eu-west-2" {
  provider = aws.eu-west-2
  key_name   = var.ssh-key-name
  public_key = var.ssh-key
}

module "clusters_eu_central_1" {

  for_each     = local.clusters_eu_central_1
  source       = "./k8s_module"
  cluster-name = each.key

  az                  = var.az
  region              = "eu-central-1"
  allowed-cidr-blocks = each.value.allowed_cidr_blocks

  ssh-key-name = var.ssh-key-name
  ssh-key-path = var.ssh-key-path
}

module "clusters_eu_west_1" {
  providers = {
    aws = aws.eu-west-1
  }

  for_each     = local.clusters_eu_west_1
  source       = "./k8s_module"
  cluster-name = each.key

  instance-ami = "ami-0c259a97cbf621daf"

  az                  = var.az
  region              = "eu-west-1"
  allowed-cidr-blocks = each.value.allowed_cidr_blocks

  ssh-key-name = var.ssh-key-name
  ssh-key-path = var.ssh-key-path
}

module "clusters_eu_west_2" {
  providers = {
    aws = aws.eu-west-2
  }

  for_each     = local.clusters_eu_west_2
  source       = "./k8s_module"
  cluster-name = each.key

  instance-ami = "ami-013fadefd0ab548ef"

  az                  = var.az
  region              = "eu-west-2"
  allowed-cidr-blocks = each.value.allowed_cidr_blocks

  ssh-key-name = var.ssh-key-name
  ssh-key-path = var.ssh-key-path
}
