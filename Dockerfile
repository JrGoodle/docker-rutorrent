FROM crazymax/rtorrent-rutorrent:latest

# set labels
LABEL maintainer="XxAcielxX"
LABEL org.opencontainers.image.vendor="XxAcielxX"
LABEL org.opencontainers.image.title="ruTorrent"
LABEL org.opencontainers.image.description="rTorrent and ruTorrent Docker based image"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/xxacielxx/rutorrent"
LABEL org.opencontainers.image.source="https://github.com/XxAcielxX/docker-rutorrent"

# modifications
RUN \
  echo "**** apply patches for /downloads ****" && \
  sed -i -e '149s/themes [*\]/themes/; 241s_[*/]_/downloads_; 150,151d;386,387d' '/etc/cont-init.d/03-config.sh' && \
  sed -i -e '5,23s/[*/]complete//' '/tpls/etc/nginx/conf.d/webdav.conf' && \
  sed -i -e '/pex\.set/s/yes/no/; /umask\.set/s/^/#/; 56,60d' '/tpls/.rtorrent.rc' && \
  sed -i -e '/complete\//d; /temp\//d; /directory\.default/s/download_temp/download/' '/tpls/etc/rtorrent/.rtlocal.rc'

VOLUME [ "/data", "/downloads", "/passwd" ]

HEALTHCHECK NONE
