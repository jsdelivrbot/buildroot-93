#!/bin/sh

# Mount debugfs by adding it to fstab

DEBUGFS='debugfs /sys/kernel/debug debugfs defaults 0 0'
if ! grep -q debugfs ${TARGET_DIR}/etc/fstab; then
        echo $DEBUGFS >> ${TARGET_DIR}/etc/fstab
fi
