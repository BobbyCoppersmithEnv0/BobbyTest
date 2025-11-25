variable "name" {
  type    = string
  default = "env0-acme-ec2-CPRSMITH-TEST"
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}

variable "vpc_id" {
  type = string
}

# NEW > Artem [Below] : Data volume size (in GiB) for the extra EBS volume
variable "data_volume_size" {
  description = "Size of the additional EBS data volume in GiB."
  type        = number
  default     = 12
}
