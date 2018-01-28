resource "aws_ebs_volume" "oregon-sda" {
  availability_zone = "us-west-2c"
  snapshot_id = "snap-d793f589"
  tags {
    Name = "oregon"
  }
}

resource "aws_ebs_volume" "pg_wal" {
  availability_zone = "us-west-2c"
  size = 100
  tags {
    Name = "pg_wal"
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
