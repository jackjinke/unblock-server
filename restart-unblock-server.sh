docker container stop unblock-server
docker container rm unblock-server -f
docker image remove jackjinke/unblock-server -f
docker build -t jackjinke/unblock-server .
docker run -d -p 80:80 -p 53:53/tcp -p 53:53/udp --restart=always --cap-add=NET_ADMIN --name=unblock-server jackjinke/unblock-server
