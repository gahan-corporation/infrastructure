terraform {
  backend "s3" {
    bucket = "terraform.gahan-corporation.com"
    key    = "oregon.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-2"
}

resource "aws_key_pair" "general-disarray" {
  key_name = "general_disarray"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCraOI8EdofAFS57yfO13TRFSWb2Xpcr4SpjuhSRlSOz0YX3wax3kxGaZgFPqYX7nhptOj6+zbsPMXrZioK/ScgoEVInWMyr5dQA70AKmYKD7I9CYejLop5cTxwCuJHfbiBD4xyw+rdKs/SH55zj+k7oKvFFlndP6sImMvfaUQIDimxcMEud7SMDKwYA6MwRe6gA+uSzLKaUZmepWx/OnunJRl36vu07fXT5snizKv2iVSSt8qxv2QEE1iMCied/QlGSOEjF9qxeiqlE0KGZ573Ms4AIHyjJbfzKnsgM67rfss91KYffZ18V17xM/SzyUjcO/w45VYAEWNVQggtXiFZ general_disarray"
}

resource "aws_instance" "oregon" {
  ami = "ami-9abea4fb"
  instance_type = "t2.large"

  tags {
    name = "oregon"
  }
}

resource "aws_instance" "docker" {
  ami = "ami-9557e0ed"
  instance_type = "t2.micro"
  key_name = "professor-chaos"

  provisioner "local-exec" {
    command = "ap nginx/provision.yml" 
  }
}

resource "aws_eip" "docker" {
  instance = "${aws_instance.docker.id}"
}
