terraform {
  backend "s3" {
    bucket = "terraform.gahan-corporation.com"
    key    = "heroku.tfstate"
    region = "us-west-2"
  }
}

variable "heroku_api_key" {}
variable "dev_aws_secret_access_key" {}
variable "dev_aws_access_key_id" {}

provider "heroku" {
  email   = "xander@gahancorporation.com"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "dev" {
  name   = "rsum-dev"
  region = "us"

  config_vars {
    AWS_ACCESS_KEY_ID = "${var.dev_aws_access_key_id}"
    AWS_SECRET_KEY_ID = "${var.dev_aws_secret_access_key}"
    DISABLE_COLLECTSTATIC = 1 
    DJANGO_SETTINGS_MODULE = "rsum.settings"
    RSUM_ENV = "dev"
  }

  buildpacks = [
    "heroku/python"
  ]
}
