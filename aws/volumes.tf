resource "aws_ebs_volume" "oregon-sda" {
  availability_zone = "us-west-2c"
  snapshot_id = "snap-d793f589"
}

resource "aws_ebs_volume" "oregon-gprof" {
  availability_zone = "us-west-2c"
  size = 300
  tags {
    Name = "gprof"
  }
}

resource "aws_ebs_volume" "oregon-pgwal" {
  availability_zone = "us-west-2c"
  size = 100
  tags {
    Name = "pgwal"
  }
}

resource "aws_ebs_volume" "oregon-pgsystem" {
  availability_zone = "us-west-2c"
  size = 100
  tags {
    Name = "pgsystem"
  }
}

resource "aws_ebs_volume" "oregon-pgdata" {
  availability_zone = "us-west-2c"
  size = 100
  tags {
    Name = "pgdata"
  }
}
