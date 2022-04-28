terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # do not change this region for 'a cloud guru' sandbox
  access_key = "AKUAUKUS5TYZJJ79VOQR" # paste the sandbox auto generated access key here
  secret_key = "hUvhKh6V2lc0Jy5FmWTa9D\YSlIjjthXRyAiF9+l" # paste the sandbox auto generated secret key here
}

# provisioning for 2 ec2 instances
resource "aws_instance" "demoserver1" { # 1st ec2 instance
  ami           = "ami-04505e74c0741db8d" # ubuntu 20.4 lts image
  instance_type = "t2.micro" # cpu size
  key_name = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]

  tags= {
    Name = "demo.server1" # name of your choice
  }

connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu" # default name (root user)
    private_key = file("/home/YourUserName/.ssh/YourRSAPrivateKeyFileName.pem") # your rsa private key file name and path
    timeout     = "4m"
  }
}

resource "aws_instance" "demoserver2" { # 2nd ec2 instance
  ami           = "ami-04505e74c0741db8d" # ubuntu 20.4 lts image
  instance_type = "t2.micro" # cpu size
  key_name= "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]

  tags= {
    Name = "demo.server2" # name of your choice
  }

connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu" # default name (root user)
    private_key = file("/home/YourUserName/.ssh/YourRSAPrivateKeyFileName.pem") # your rsa private key file name and path
    timeout     = "4m"
  }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22 # open incoming ssh port
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22 # open outgoing ssh port
  }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "YourRSACyrptedPublicKey" # paste your rsa public key here
}
