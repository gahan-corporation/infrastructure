provider "aws" {
  region = "us-west-2"
  profile = "ab"
  shared_credentials_file = "/Users/duchess/.aws/credentials"
}

resource "aws_instance" "ab" {
  ami = "ami-3552e54d"
  availability_zone = "us-west-2a"
  instance_type = "t2.nano"
  tags {
    Name = "tmp"
  }
}
