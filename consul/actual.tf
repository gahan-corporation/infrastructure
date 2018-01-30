terraform {
  backend "s3" {
    bucket = "terraform.gahan-corporation.com"
    key    = "actual.tfstate"
    region = "us-west-2"
  }
}

provider "consul" {
  address = "gahan-corporation.com:8500"
  datacenter = "west1"
}

resource "consul_agent_service" "search" {
  address = "www.google.com"
  name    = "google"
  port    = 80
  tags    = ["external", "search"]
}
