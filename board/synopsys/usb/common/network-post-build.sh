#/bin/sh

# Clear all the interface
STRING="# Network interfaces are managed by Connman"
echo $STRING > ${TARGET_DIR}/etc/network/interfaces
