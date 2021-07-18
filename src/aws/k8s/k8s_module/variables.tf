variable "cluster-name" {
  description = "Controls the naming of the AWS resources"
}

variable "vpc-cidr" {
  default = "192.168.0.0/16"
}

variable "allowed-cidr-blocks" {
  description = "A comma separated list of CIDR blocks to allow SSH connections from."
}

variable "region" {
}

variable "az" {
}

variable "instance-ami" {
  default     = "ami-0c259a97cbf621daf"
  description = "Which ami is used"
}

variable "control-plane-instance-type" {
  default     = "t3.small"
  description = "Which EC2 instance type to use for the control-plane node"
}

variable "node-instance-type" {
  default     = "t3.small"
  description = "Which EC2 instance type to use for the worker nodes"
}

locals {
  bootstraptoken = "abcdef.0123456789abcdef"
}

variable "ssh-key-path" {
}

variable "ssh-key-name" {
}
