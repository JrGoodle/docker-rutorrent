#!/usr/bin/with-contenv sh
#shellcheck shell=sh

if [ -z "${DOWNLOAD_SUBDIR:-}" ]; then
    # DOWNLOAD_SUBDIR is unset or empty
    DOWNLOAD_DIR='/downloads/'
else
    # DOWNLOAD_SUBDIR is set to non-empty value
    DOWNLOAD_DIR="/downloads/${DOWNLOAD_SUBDIR}/"
fi

sed -i -e "s!@DOWNLOAD_DIR@!$DOWNLOAD_DIR!g" /etc/rtorrent/.rtlocal.rc
