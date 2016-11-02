#!/bin/sh

# Mount debugfs by adding it to fstab

DEBUGFS='debugfs\t/sys/kernel/debug\tdebugfs\tdefaults\t0\t0'
if ! grep -q debugfs ${TARGET_DIR}/etc/fstab; then
        echo -e $DEBUGFS >> ${TARGET_DIR}/etc/fstab
fi
