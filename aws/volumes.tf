resource "aws_ebs_volume" "oregon-sda" {
  availability_zone = "us-west-2c"
  snapshot_id = "snap-d793f589"
  tags {
    Name = "oregon"
  }
}
