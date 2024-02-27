provider "aws" {
  region = var.region
}



data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = "subnet-d1b6dd8b"

  tags = {
    Name = var.instance_name
    TestAction = "Direct github edit/commit"
    Improvement = "This was a commit to iops-XXX-pretend-project-branch"
  }
}
