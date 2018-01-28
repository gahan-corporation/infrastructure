provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}

resource "docker_container" "nginx" {
  image = "${docker_image.di-nginx.name}"
  name  = "nginx"
}

resource "docker_image" "di-nginx" {
  name          = "gcorp/nginx:iss5" 
}
