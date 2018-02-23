provider "docker" {
  host = "tcp://127.0.0.1:2375/"
}

resource "docker_volume" "nginx" {
  name = "etc"
}

resource "docker_network" "rsum" {
  name = "rsum"
}

resource "docker_container" "nginx" {
  image = "nginx:alpine"
  name  = "docs"
  networks = ["rsum"]
  publish_all_ports = "true"
  ports {
    internal = "80"
    external = "80"
    ip = "0.0.0.0"
  }
  ports {
    internal = "443"
    external = "443"
    ip = "0.0.0.0"
  }
}

resource "docker_container" "postgres" {
  image = "postgres:alpine"
  name = "postgres"
  networks = ["rsum"]
  ports {
    internal = "5432"
    external = "5432"
    ip = "0.0.0.0"
  }
}

resource "docker_container" "rsum" {
  image = "python:alpine"
  name = "rsum"
  networks = ["rsum"]
}

resource "docker_image" "di-nginx" {
  name          = "gcorp/nginx:latest" 
}
