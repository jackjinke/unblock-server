publicIP6=$(dig +short -6 myip.opendns.com aaaa @resolver1.ipv6-sandbox.opendns.com)

echo "
server=2001:4860:4860::8888
server=2620:0:ccc::2
address=/music.163.com/${publicIP6}
address=/ip.ws.126.net/${publicIP6}
address=/music.httpdns.c.163.com/${publicIP6}
address=/nstool.netease.com/${publicIP6}
" >> /etc/dnsmasq.conf
