#!/bin/bash

eval "$(gnome-keyring-daemon)"
export GNOME_KEYRING_CONTROL
echo "${DBUS_SESSION_BUS_ADDRESS}"
echo "${GNOME_KEYRING_CONTROL}"
# keyring --list-backends
# secret-tool search --all --unlock service vscode-cli
"${HOME}/.local/bin/code" tunnel "${@}"