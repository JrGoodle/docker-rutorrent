#!/usr/bin/with-contenv sh
#shellcheck shell=sh

if [ -z "${DOWNLOAD_SUBDIR:-}" ]; then
    echo 'DOWNLOAD_SUBDIR is unset or empty'
    DOWNLOAD_DIR='/downloads/'
else
    echo "DOWNLOAD_SUBDIR is set to non-empty value: ${DOWNLOAD_SUBDIR}"
    DOWNLOAD_DIR="/downloads/${DOWNLOAD_SUBDIR}/"
fi

echo "DOWNLOAD_DIR set to: ${DOWNLOAD_DIR}"

sed -i -e "s!@DOWNLOAD_DIR@!$DOWNLOAD_DIR!g" '/etc/rtorrent/.rtlocal.rc'
