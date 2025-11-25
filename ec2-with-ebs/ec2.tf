module "acme-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = var.name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_ids = data.aws_subnet_ids.selected.ids

  associate_public_ip_address = true

 # NEW: Extra EBS data volume with size from variable
  ebs_block_device = [
    {
      device_name           = "/dev/sdf"
      volume_type           = "gp3"
      volume_size           = var.data_volume_size
      delete_on_termination = true
      encrypted             = false
    }
  ]


  tags = {
    Terraform = "true"
    Owner     = "acme demo org"
    Test      = "new taga"
    Demo      = "May 20"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id
}
