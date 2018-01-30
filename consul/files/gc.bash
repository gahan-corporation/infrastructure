docker run --net=host --rm --name=dev-consul -e CONSUL_BIND_INTERFACE=eth0 consul agent -join 34.213.189.167 -advertise 34.214.20.194
