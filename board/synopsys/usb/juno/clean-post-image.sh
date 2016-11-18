#/bin/sh

set -e

# Remove some image outputs

rm -rf ${BINARIES_DIR}/bl2.bin
rm -rf ${BINARIES_DIR}/bl2u.bin
rm -rf ${BINARIES_DIR}/bl31.bin
