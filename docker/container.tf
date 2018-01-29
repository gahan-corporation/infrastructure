provider "docker" {
  host = "tcp://127.0.0.1:2375/"
}

variable "nginx_etc_path" {}

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

resource "docker_image" "di-nginx" {
  name          = "gcorp/nginx:iss7" 
}
