provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}

resource "docker_container" "nginx" {
  image = "${docker_image.gc.latest}"
  name  = "nginx"
}

resource "docker_image" "gc" {
  name = "gcorp:nginx"
}
