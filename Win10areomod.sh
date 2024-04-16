sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-kvm -y
qemu-img create -f raw win.img 32G
wget -O virtio-win.iso 'https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.215-1/virtio-win-0.1.215.iso'
wget -O win.iso 'https://go.microsoft.com/fwlink/p/?LinkID=2195404&clcid=0x409&culture=en-us&country=US'
clear
sudo qemu-system-x86_64 -m 12G -smp 4 -cpu host -boot order=c -drive file=win.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device e1000,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios virtio-win.iso
