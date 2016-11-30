#/bin/sh

set -e

# Create an image with a partition containing the rootfs

GENIMAGE_ROOTFS_CFG="board/synopsys/usb/juno/genimage_rootfs.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

# Clean previous build
rm -rf $GENIMAGE_TMP
date > $BINARIES_DIR/.build

# Create image for rootfs
genimage \
    --rootpath $TARGET_DIR \
    --tmppath $GENIMAGE_TMP \
    --inputpath $BINARIES_DIR \
    --outputpath $BINARIES_DIR \
    --config $GENIMAGE_ROOTFS_CFG

rm -f $BINARIES_DIR/.build
rm -f $BINARIES_DIR/data.vfat
rm -f $BINARIES_DIR/rootfs.ext2
rm -f $BINARIES_DIR/rootfs.ext4
gzip -f $BINARIES_DIR/rootfs.img
