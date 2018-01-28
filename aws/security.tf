resource "aws_security_group" "mail" {
  name        = "mail"
  description = "Mail ports."

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["172.17.0.1/32"]
  }

  tags {
    Name = "mail"
  }
}

resource "aws_security_group" "default" {
  name = "default"
  description = "Default security group."
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443 
    to_port = 443 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port = 64999 
    protocol = "tcp"
    cidr_blocks = ["172.249.87.205/32"]
  }
  tags {
    Name = "default"
  }
}
