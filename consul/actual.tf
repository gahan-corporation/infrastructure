terraform {
  backend "s3" {
    bucket = "terraform.gahan-corporation.com"
    key    = "actual.tfstate"
    region = "us-west-2"
  }
}

provider "consul" {
  address = "gahan-corporation.com:8500"
  datacenter = "dc1"
}

resource "consul_agent_service" "search" {
  address = "www.google.com"
  name    = "google"
  port    = 80
  tags    = ["external", "search"]
}

resource "consul_catalog_entry" "app" {
  address = "34.213.189.167"
  node    = "foobar"

  service = {
    address = "127.0.0.1"
    id      = "nginx1"
    name    = "nginx"
    port    = 80
    tags    = ["master", "v1"]
  }

  service = {
    address = "127.0.0.1"
    id      = "nginx2"
    name    = "nginxs"
    port    = 443 
    tags    = ["master", "v1"]
  }
}
