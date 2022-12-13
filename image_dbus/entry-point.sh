#!/bin/bash

#if test ! -f /etc/machine-id; then
#  sudo dbus-uuidgen --ensure=/etc/machine-id
#fi
sudo dbus-uuidgen --ensure=/etc/machine-id
exec /usr/bin/dbus-run-session bash /tunnel-session.sh "${@}"