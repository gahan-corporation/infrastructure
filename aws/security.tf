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
