provider "aws" {
  region = var.region
}
locals {
  // A comma separated list of CIDR blocks to allow SSH connections from.
  allowed-cidr-blocks = "0.0.0.0/0"
}

resource "aws_key_pair" "main" {
  key_name   = var.ssh-key-name
  public_key = var.ssh-key
}

resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  tags                 = { Name = "Dockerhost" }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  depends_on = [aws_internet_gateway.gw]
  tags       = { Name = "Dockerhost" }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.r.id
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.234.0/24"
  availability_zone       = "${var.region}${var.az}"
  map_public_ip_on_launch = true
  tags                    = { Name = "Dockerhost" }
}

resource "aws_security_group" "dockerhost" {
  name        = "Dockerhost"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id
  tags        = { Name = "Dockerhost" }
}

resource "aws_security_group_rule" "allow_all_from_self" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.dockerhost.id
  security_group_id        = aws_security_group.dockerhost.id
}

resource "aws_security_group_rule" "allow_ssh_from_admin" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = split(",", local.allowed-cidr-blocks)
  security_group_id = aws_security_group.dockerhost.id
}

resource "aws_security_group_rule" "allow_8080_from_internet" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dockerhost.id
}

resource "aws_security_group_rule" "allow_8081_from_internet" {
  type              = "ingress"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dockerhost.id
}

resource "aws_security_group_rule" "allow_all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dockerhost.id
}

module "dockerhost" {
  // Specify how many dockerhosts to deploy
  count = 1
  source          = "./dockerhost_module"
  dockerhost-name = "dockerhost-${count.index + 1}"

  aws_subnet_id = aws_subnet.main.id

  vpc_security_group_ids = aws_security_group.dockerhost.id

  az                  = var.az
  region              = var.region

  ssh-key-name = var.ssh-key-name
  ssh-key-path = var.ssh-key-path
  aws_internet_gateway = aws_internet_gateway.gw
}
