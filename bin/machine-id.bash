#!/usr/bin/env bash

case "${OSTYPE}" in
darwin*)
    sysctl -n kern.uuid
    ;;
freebsd*)
    sysctl -n kern.hostuuid
    ;;
linux*)
    cat /var/lib/dbus/machine-id
    ;;
esac
