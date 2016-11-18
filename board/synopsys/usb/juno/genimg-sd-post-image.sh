#/bin/sh

set -e

JUNO_IMAGES_CFG="board/synopsys/usb/juno/images.txt"
GENIMAGE_CFG="board/synopsys/usb/juno/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
VEXPRESS_DIR="${STAGING_DIR}/usr/share/vexpress-firmware"
SD_TMP_DIR="${BUILD_DIR}/sd"

# Clean previous build
rm -rf $GENIMAGE_TMP
rm -rf $SD_TMP_DIR

# Create SD structure
install -d $SD_TMP_DIR/MB/HBI0262D
install -d $SD_TMP_DIR/SITE1/HBI0262D
install -d $SD_TMP_DIR/SITE2/HBI0001A
install -d $SD_TMP_DIR/SOFTWARE

# Copy motherboard firmware
install -m 644 $VEXPRESS_DIR/MB/HBI0262D/* $SD_TMP_DIR/MB/HBI0262D

# Copy V2M-Juno DevChip and images configurations
install -m 644 $VEXPRESS_DIR/config.txt $SD_TMP_DIR
install -m 644 $VEXPRESS_DIR/SITE1/HBI0262D/board.txt $SD_TMP_DIR/SITE1/HBI0262D
install -m 644 $JUNO_IMAGES_CFG $SD_TMP_DIR/SITE1/HBI0262D

# Create an empty config file for HT3 adapter board
echo 'BOARD: HBI0001A' > $SD_TMP_DIR/SITE2/HBI0001A/board.txt

# kernel image, device tree binary, and bootloader
install -m 644 $VEXPRESS_DIR/SOFTWARE/hdlcdclk.dat $SD_TMP_DIR/SOFTWARE
install -m 644 $VEXPRESS_DIR/SOFTWARE/bl0.bin $SD_TMP_DIR/SOFTWARE
install -m 644 $BINARIES_DIR/Image $SD_TMP_DIR/SOFTWARE
install -m 644 $BINARIES_DIR/juno-r2.dtb $SD_TMP_DIR/SOFTWARE
install -m 644 $BINARIES_DIR/fip.bin $SD_TMP_DIR/SOFTWARE
install -m 644 $BINARIES_DIR/bl1.bin $SD_TMP_DIR/SOFTWARE

# Archive SD contents
tar -czf sdcard_contents.tar.gz $SD_TMP_DIR

genimage \
    --rootpath $SD_TMP_DIR \
    --tmppath $GENIMAGE_TMP \
    --inputpath $BINARIES_DIR \
    --outputpath $BINARIES_DIR \
    --config $GENIMAGE_CFG

rm -rf $SD_TMP_DIR
rm -f $BINARIES_DIR/sd.vfat
gzip -f $BINARIES_DIR/sd.img
