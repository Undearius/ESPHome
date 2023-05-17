#!/bin/bash
NAME=esphome
IMAGE=esphome/esphome
HDD=/srv/dev-disk-by-label-Meta/meta
SSD=/srv/dev-disk-by-label-Festra/festra
BLUE=/srv/6912da68-13d3-48c5-9deb-739a2024e7b9/blue

source dockerupdate.sh

docker run -d \
  --name=${NAME} \
  --restart unless-stopped \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Toronto \
  -v ${SSD}/${NAME}:/config \
  --tmpfs /tmp \
  --net=host \
  --privileged \
  --device=/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_A50285BI-if00-port0 \
  ${IMAGE}
