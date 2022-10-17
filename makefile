boot_sector.bin:boot_sector.asm print.asm print_hex.asm
	@echo "Creating binary..."
	@nasm boot_sector.asm -f bin -o boot_sector.bin

clean:
	@echo "Removing binary..."
	@rm boot_sector.bin
	@rm os.iso

run:
	@echo "Running..."
	@qemu-system-x86_64 boot_sector.bin

iso:
	@echo "Truncating..."
	@truncate boot_sector.bin -s 1200k
	@echo "Converting..."
	@mkisofs -o os.iso -b boot_sector.bin ./
