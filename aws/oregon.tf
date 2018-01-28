terraform {
  backend "s3" {
    bucket = "terraform.gahan-corporation.com"
    key    = "oregon.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-2"
}

resource "aws_key_pair" "general-disarray" {
  key_name = "general_disarray"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCraOI8EdofAFS57yfO13TRFSWb2Xpcr4SpjuhSRlSOz0YX3wax3kxGaZgFPqYX7nhptOj6+zbsPMXrZioK/ScgoEVInWMyr5dQA70AKmYKD7I9CYejLop5cTxwCuJHfbiBD4xyw+rdKs/SH55zj+k7oKvFFlndP6sImMvfaUQIDimxcMEud7SMDKwYA6MwRe6gA+uSzLKaUZmepWx/OnunJRl36vu07fXT5snizKv2iVSSt8qxv2QEE1iMCied/QlGSOEjF9qxeiqlE0KGZ573Ms4AIHyjJbfzKnsgM67rfss91KYffZ18V17xM/SzyUjcO/w45VYAEWNVQggtXiFZ general_disarray"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.do.id}"
  depends_on = ["aws_instance.do"]
}

resource "aws_instance" "do" {
  ami = "ami-3552e54d"
  instance_type = "t2.micro"
  key_name = "general_disarray"
  availability_zone = "us-west-2c"
  root_block_device {
    volume_size = 100
    volume_type = "standard"
  }
  tags {
    Name = "docker"
  }
  provisioner "remote-exec" {
    inline = [
      "pacman -Syy --noconfirm python",
      "pacman -S --noconfirm wget",
      "wget https://bootstrap.pypa.io/get-pip.py",
      "python get-pip.py",
      "rm get-pip.py",
    ]
    connection {
      type = "ssh"
      user = "root"
      private_key = "${file("/Users/duchess/Documents/keys/general_disarray.pem")}"
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ~/Documents/keys/general_disarray.pem -i '${aws_instance.do.public_ip},' docker/provision.yml"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i '${aws_instance.do.public_ip},' docker/post.yml"
  }
}
