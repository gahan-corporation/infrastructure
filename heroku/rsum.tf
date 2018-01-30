variable "heroku_api_key" {}

provider "heroku" {
  email   = "xander@gahancorporation.com"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "dev" {
  name   = "rsum-dev"
  region = "us"

  config_vars {
    DISABLE_COLLECTSTATIC = 1 
  }

  buildpacks = [
    "heroku/python"
  ]
}
