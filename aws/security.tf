resource "aws_security_group" "default" {
  description = "default VPC security group"
  vpc_id = "vpc-71fff513"
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
