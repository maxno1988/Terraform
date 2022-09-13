provider "aws" {
  region = "eu-central-1"
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [var.Main-VPC]
  }
  tags = {
    Name = "PublicSubnet-1"
  }
}

data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "EC2" {
  for_each      = toset(data.aws_subnets.public.ids)
  ami           = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  subnet_id     = each.value

  tags = {
    Name = "terraform-example"
  }
}
