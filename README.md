## Pelican Static Page
Folder pelican-data berisi website statis menggunakan web generator ([Pelican](https://blog.getpelican.com/))

## Dockerfile
Berisi perintah-perintah untuk membuat image docker, menggunakan image ([alpine3.4](https://hub.docker.com/_/alpine/))
```
FROM alpine:3.4

RUN apk -U add \
    python \
    python3 \
    perl \
    make \
    && apk -U add --virtual deps \
    py-pip \
    && pip install pelican markdown \
    && apk del deps \
    && rm -rf /var/cache/apk/*

COPY start.sh start.sh
RUN chmod +x start.sh
EXPOSE 4000

CMD ["/bin/sh", "start.sh"]
```
## Docker Compose
Docker Compose ini digunakan untuk membuat container dari docker image 

```
version: '2'
services:
  pelican:
    image: pelicanmaster
    ports:
      - 4000:4000
    volumes:
      - ~/docker-pelican-master/pelican-data:/opt/data

```

Jalankan docker-compose 
```
beme@be:~/docker-pelican-master$ sudo docker-compose up
Starting dockerpelicanmaster_pelican_1
Attaching to dockerpelicanmaster_pelican_1
pelican_1  | make: *** No rule to make target 'clean'.  Stop.
pelican_1  | make: *** No rule to make target 'html'.  Stop.
pelican_1  | 172.18.0.1 - - [25/Jul/2017 16:44:09] "GET / HTTP/1.1" 200 -
pelican_1  | 172.18.0.1 - - [25/Jul/2017 16:44:09] "GET /theme/css/main.css HTTP/1.1" 200 -
pelican_1  | 172.18.0.1 - - [25/Jul/2017 16:44:09] "GET /theme/css/reset.css HTTP/1.1" 200 -
pelican_1  | 172.18.0.1 - - [25/Jul/2017 16:44:09] "GET /theme/css/pygment.css HTTP/1.1" 200 -
pelican_1  | 172.18.0.1 - - [25/Jul/2017 16:44:09] "GET /theme/css/typogrify.css HTTP/1.1" 200 -

```
Lalu akses http://localhost:4000/ untuk melihat hasil web seperti gambar di bawah : 
![localhost](https://github.com/FreddyAprilliant/responsitccl/blob/master/pelican-data/SS.png)

## Prestasi
1. Github Contribution: https://github.com/part-up/part-up/pulls?q=is%3Apr+is%3Aclosed+author%3AFreddyAprilliant
