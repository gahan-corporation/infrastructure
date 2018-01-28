provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}

resource "docker_volume" "etc-nginx" {
  host_path = "nginx/files/etc"
  container_path = "/etc/nginx"
}

resource "docker_network" "gcorpnet" {
  name = "gcorp"
}

resource "docker_container" "nginx" {
  image = "${docker_image.di-nginx.name}"
  name  = "nginx"
  networks = ["gcorp"]
}

resource "docker_image" "di-nginx" {
  name          = "gcorp/nginx:iss5" 
}
