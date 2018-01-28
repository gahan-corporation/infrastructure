provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-2"
}

resource "aws_instance" "oregon" {
  ami           = " ami-9abea4fb"
  instance_type = "t2.large"
}
