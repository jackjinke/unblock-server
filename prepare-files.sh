publicIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
publicIP6=$(dig +short -6 myip.opendns.com aaaa @resolver1.ipv6-sandbox.opendns.com)

echo "no-resolv
server=8.8.8.8
server=208.67.222.222
server=2001:4860:4860::8888
server=2620:0:ccc::2
address=/music.163.com/${publicIP}
address=/music.163.com/${publicIP6}
address=/ip.ws.126.net/${publicIP}
address=/ip.ws.126.net/${publicIP6}
address=/music.httpdns.c.163.com/${publicIP}
address=/music.httpdns.c.163.com/${publicIP6}
address=/m10.music.126.net/157.185.161.30
address=/m10.music.126.net/157.185.161.30
address=/nstool.netease.com/${publicIP}
address=/nstool.netease.com/${publicIP6}
" >> /etc/dnsmasq.conf

echo "server {
  listen       80;
  listen       [::]:80;
  server_name  music.httpdns.c.163.com;
  
  location /d {
    default_type application/json;
    return 200 '{\"dns\":[{\"host\":\"music.httpdns.c.163.com\",\"ips\":[\"${publicIP}\"],\"ttl\":36000,\"http2\":0},{\"host\":\"music.163.com\",\"ips\":[\"${publicIP}\"],\"ttl\":36000, \"http2\":0}]}';
  }
}" >> /etc/nginx/conf.d/httpdns.conf
