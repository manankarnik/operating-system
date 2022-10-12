echo "Building..."
nasm boot_sector.asm -f bin -o boot_sector.bin
echo "Running..."
qemu-system-x86_64 boot_sector.bin
