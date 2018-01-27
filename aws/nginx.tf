provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-2"
}

resource "aws_instance" "nginx" {
  ami           = "ami-3552e54d"
  instance_type = "t2.micro"    
}
