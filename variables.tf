variable "name" {
  type    = string
  default = "env0-acme-ec2"
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}

variable "vpc_id" {
  type = string
}

variable "ebs_size_gb" {
  type    = number
  default = 10
}

variable "ebs_vol" {
  type    = string
  default = gp3
}
