docker run -di --name nginx -d -p 80:80 \
 -v /data/nginx/log:/var/log/nginx \
 -v /data/nginx/conf.d:/etc/nginx/conf.d \
 -v /data/nginx/nginx.conf:/etc/nginx/nginx/conf \
 -v /home/git/public:/html \
 nginx