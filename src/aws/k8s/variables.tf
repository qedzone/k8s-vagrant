variable "region" {
  default = "eu-west-1"
}

variable "az" {
  default = "a"
}

variable "ssh-key-path" {
  default = "~/.ssh/id_rsa_lab"
}

variable "ssh-key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxf+71h6WXoJPVQW+uXwXvXGoMASgdD59XroehVzyks97Hu+U8/uEDOnbXfFOq5H/2IJS2RFE3JlDX9xJkHNHLvMYota2MTQpj0FoHV/1f619PVM+0sowDKn01b7v6tcO6ELfybyK96yuATSGzHlu8NgHVio5/RUtLva4XDi7uKpw58OrXAigtvGSPnzpRFYea94QWeAep68qKnMtWiTOAt8RF4roq8xAJcn41WApuQl1pt1ReT8+BQ+3G0dH7531N3kKYMaPlYr6kPEz5bhBht0MEsxa/3JNbdxRbSUmEswCXUn7ZNdF9iucRYW+BVESo6GQMOVJ3AoQdtRx3/YGf"
}

variable "ssh-key-name" {
  default = "test-ssh"
}
