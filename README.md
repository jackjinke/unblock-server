# Unblock-server

A reverse proxy server for unblocking some Chinese regional limited services.
Also supports DNS and PAC for mobile devices.

## Installation
```console
docker build -t jackjinke/unblock-server .
docker run -d -p 80:80 -p 53:53/tcp -p 53:53/udp --restart=always --cap-add=NET_ADMIN --name=unblock-server jackjinke/unblock-server
```

## Credit
Thanks [@JixunMoe](https://github.com/JixunMoe) for his [blog](https://jixun.moe/2017/01/01/ymusic-hosts-fix/)!
