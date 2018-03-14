publicIP=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo "no-resolv
server=8.8.8.8
server=208.67.222.222
address=/music.163.com/${publicIP}
address=/ip.ws.126.net/${publicIP}
address=/music.httpdns.c.163.com/${publicIP}
address=/m7.music.126.net/115.127.231.194
address=/m8.music.126.net/114.236.140.97
address=/m9.music.126.net/115.127.231.97
address=/m10.music.126.net/114.236.140.96

address=/nstool.netease.com/${publicIP}
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
