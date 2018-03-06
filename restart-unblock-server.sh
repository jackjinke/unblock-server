docker container stop unblock-server
docker container prune
docker image remove jackjinke/unblock-server
docker build -t jackjinke/unblock-server .
docker run -d -p 80:80 -p 53:53/tcp -p 53:53/udp --restart=always --cap-add=NET_ADMIN --name=unblock-server jackjinke/unblock-server
