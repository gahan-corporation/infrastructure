terraform {
  backend "s3" {
    bucket = "terraform.gahan-corporation.com"
    key = "docker.tfstate"
    region = "us-west-2"
  }  
}

provider "docker" {
  host = "tcp://127.0.0.1:2375/"
}

resource "docker_volume" "etc-nginx" {
  name = "etc"
}

resource "docker_network" "gcorpnet" {
  name = "gcorp"
}

resource "docker_container" "nginx" {
  image = "${docker_image.di-nginx.name}"
  name  = "nginx"
  networks = ["gcorp"]
  publish_all_ports = "true"
  volumes {
    host_path = "${var.nginx_etc_path}"
    container_path = "/etc/nginx"
  }
  volumes {
    host_path = "/etc/ansible"
    container_path = "/etc/ansible"
  }
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
  networks = ["gcorp"]
  volumes {
    host_path = "${var.postgres_data_dir}"
    container_path = "/var/lib/postgresql/data"
  }
  volumes {
    host_path = "${var.postgres_cert_dir}"
    container_path = "/var/lib/postgresql/.postgresql"
  }
  ports {
    internal = "5432"
    external = "5432"
    ip = "0.0.0.0"
  }
}

resource "docker_container" "gcorp" {
  image = "gahancorpcfo/gpv"
  name = "gcorp"
  networks = ["gcorp"]
}

resource "docker_image" "di-nginx" {
  name          = "gcorp/nginx:latest" 
}
