FROM nginx:alpine
# Setup proxy server
COPY proxy.conf /etc/nginx/conf.d/proxy.conf
COPY ipquery.txt /etc/nginx/html/163/ipquery.txt
COPY info.js /usr/share/nginx/html/info.js
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# If you want to add a homepage for your server:
# Name it index.html, put it in same directory as Dockerfile,
# and uncomment next line
# COPY index.html /usr/share/nginx/html/index.html

# Setup DNS and PAC
RUN apk --no-cache add bind-tools dnsmasq
EXPOSE 53 53/udp
COPY prepare-files.sh /etc/prepare-files.sh
COPY prepare-files-ipv6.sh /etc/prepare-files-ipv6.sh
RUN /bin/sh -c 'sh /etc/prepare-files.sh'
RUN /bin/sh -c 'sh /etc/prepare-files-ipv6.sh'

CMD dnsmasq & nginx
