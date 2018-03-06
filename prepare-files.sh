publicIP=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo "no-resolv
server=8.8.8.8
server=208.67.222.222
address=/music.163.com/${publicIP}
address=/ip.ws.126.net/${publicIP}
address=/music.httpdns.c.163.com/${publicIP}
address=/m10.music.126.net/125.39.1.27
address=/nstool.netease.com/${publicIP}
" >> /etc/dnsmasq.conf

echo "function FindProxyForURL(url, host) {
	if (host == 'music.163.com' || host == 'ip.ws.126.net' || host == 'nstool.netease.com') {
		return 'PROXY ${publicIP}';
	} else if (host == 'music.httpdns.c.163.com') {
		return 'PROXY 127.0.0.1:9999';
	} else if (host == 'm10.music.126.net') {
		return 'PROXY 125.39.1.27:80';
	}	
	return 'DIRECT';
}" >> /usr/share/nginx/html/proxy.pac

echo "server {
  listen       80;
  listen       [::]:80;
  server_name  music.httpdns.c.163.com;
  
  location /d {
    default_type application/json;
    return 200 '{\"dns\":[{\"host\":\"music.httpdns.c.163.com\",\"ips\":[\"${publicIP}\"],\"ttl\":36000,\"http2\":0},{\"host\":\"music.163.com\",\"ips\":[\"${publicIP}\"],\"ttl\":36000, \"http2\":0}]}';
  }
}" >> /etc/nginx/conf.d/httpdns.conf
