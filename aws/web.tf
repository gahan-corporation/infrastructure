provider "aws" {
  region = "us-west-2"

  resource "aws_instance" "nginx" {
    ami           = "ami-c655e2be"
    instance_type = "t2.micro"    
  }
}
