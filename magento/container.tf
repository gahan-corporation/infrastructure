terraform {
  backend "s3" {
    bucket = "archive.my-ubox.com"
    key = "magento.tfstate"
    region = "us-west-2"
  }  
}

provider "docker" {
  host = "tcp://127.0.0.1:2375/"
}

resource "docker_container" "mariadb" {
  image = "bitnami/mariadb:latest"
  name = "mariadb"
  env = [
    "ALLOW_EMPTY_PASSWORD=yes",
    "MARIADB_USER=bn_magento",
    "MARIADB_PASSWORD=magento_db_password",
    "MARIADB_DATABASE=bitnami_magento"
  ]
}
