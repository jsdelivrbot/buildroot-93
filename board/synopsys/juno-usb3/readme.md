# ARM Juno r2 for Synopsys USB IP

## Intro

This describes the buildroot configuration for Synopsys USB IP on ARM
Juno r2.

## Building

Configure buildroot

```
  $ make snps_juno_usb3_defconfig
```

Build

```
  $ make
```

### Boot Images

Once the build completes, the following files are located in
`output/images/`. These are the main images that can be used to boot
the ARM Juno system.

* __sd.img.gz__ - The ARM Juno configuration image. This is to be used
  in the ARM Juno configuration micro SD slot. It contains the kernel,
  firmware, and other configurations.

* __rootfs.img.gz__ - The root file system image.

### Other Outputs

Additionally, there are other outputs that may be of interest. These
are the intermediate files used to generate the rootfs and SD images.

```
  +--bl1.bin         # Boot loader stage 1 (BL1)
  +--fip.bin         # Firmware Image Package
  +--Image           # Kernel image
  +--juno-r2.dtb     # Juno-r2 device tree
  +--rootfs.tar      # rootfs archive
  +--scp-fw.bin      # SCP_BL2 image (BL3-0)
  +--u-boot.bin      # u-boot (BL3-3)
```

## Prepare System

### Create Configuration Micro SD Card

Plug in a micro SD card and check its location. You can use parted or
fdisk. It should be something like `/dev/sdX` or `/dev/mmcblkX`.

Make sure the disk is unmounted.

   ```
   $ umount /dev/sdb1
   ```

Write configuration image.

   ```
   $ gunzip -c sdcard.img.gz | sudo dd of=/dev/sdb bs=64K
   ```

Sync the changes then remove the SD card.

   ```
   $ sync
   ```

### Create Root Filesystem USB Drive

Plug in a USB drive and check its location. You can use parted or
fdisk. It should be something like `/dev/sdX`.

Make sure the disk is unmounted.

   ```
   $ umount /dev/sdb1
   ```

Write the rootfs image.

   ```
   $ gunzip -c rootfs.img.gz | sudo dd of=/dev/sdb bs=64K
   ```

Sync the changes then remove the USB drive.

   ```
   $ sync
   ```

### Boot

Insert the micro SD card in the configuration micro SD card slot.

Insert the USB drive that contains the kernel rootfs into one of the
USB ports.

Press the hardware reset (white) button to power cycle and boot into
the Linux system.

The system is now ready to use.
