resource "heroku_app" "dev" {
  name   = "rsum-dev"
  region = "us"

  config_vars {
    FOOBAR = "baz"
  }

  buildpacks = [
    "heroku/python"
  ]
}
