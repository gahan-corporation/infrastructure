provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-2"
}

resource "aws_instance" "nginx" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"    
}
