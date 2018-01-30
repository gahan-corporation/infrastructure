terraform {
  backend "s3" {
    bucket = "archive.my-ubox.com"
    key    = "aws.tfstate"
    region = "us-west-2"
  }
}

variable "abio_aws_access_key_id" {}
variable "abio_aws_secret_access_key" {}

provider "aws" {
  access_key = "${var.abio_aws_access_key_id}"
  secret_key = "${var.abio_aws_secret_access_key}"
  region = "us-west-2"
}

resource "aws_instance" "abio" {
  ami_id = "ami-6e1a0117" 
  instance_id = "i-0b0b8c73e92aabc59"
}
