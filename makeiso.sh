echo "Truncating..."
truncate boot_sector.bin -s 1200k
echo "Converting..."
mkisofs -o os.iso -b boot_sector.bin ./
