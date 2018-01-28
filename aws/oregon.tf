provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-2"
}

resource "aws_instance" "oregon" {
  instance_type = "t2.large"
}

resource "aws_instance" "nginx" {
  ami = "ami-9557e0ed"
  instance_type = "t2.micro"
}

resource "aws_eip" "nginx" {
}
