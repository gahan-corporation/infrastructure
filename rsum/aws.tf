terraform {
  backend "s3" {
    bucket = "terraform.gahan-corporation.com"
    key    = "oregon.tfstate"
    region = "us-west-2"
  }
}
