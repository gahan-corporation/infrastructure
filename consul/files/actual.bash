docker run --net=host --rm --name=dev-consul -e CONSUL_BIND_INTERFACE=ens3 consul agent -bootstrap -advertise 34.213.189.167 -server -ui
