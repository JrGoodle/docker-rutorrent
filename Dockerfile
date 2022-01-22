FROM crazymax/rtorrent-rutorrent:latest

# set labels
LABEL maintainer="XxAcielxX"
LABEL org.opencontainers.image.vendor="XxAcielxX"
LABEL org.opencontainers.image.title="ruTorrent"
LABEL org.opencontainers.image.description="rTorrent + ruTorrent Docker based container"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/xxacielxx/rutorrent"
LABEL org.opencontainers.image.source="https://github.com/XxAcielxX/rutorrent"

# modifications
RUN \
 echo "**** apply patches for /downloads ****" && \
 sed -i -e '132s/themes [*\]/themes/' '/etc/cont-init.d/03-config.sh' && \
 sed -i -e '216s_[*/]_/downloads_' '/etc/cont-init.d/03-config.sh' && \
 sed -i '133,134d;349,350d' '/etc/cont-init.d/03-config.sh' && \
 sed -i -e '5,23s/[*/]complete//' '/tpls/etc/nginx/conf.d/webdav.conf'
COPY '/root/defaults/.rtorrent.rc' '/tpls/.rtorrent.rc'
COPY '/root/tpls/etc/cont-init.d/05-customize-download-dir.sh' '/tpls/etc/cont-init.d/05-customize-download-dir.sh'

VOLUME [ "/data", "/downloads", "/passwd" ]

HEALTHCHECK NONE
