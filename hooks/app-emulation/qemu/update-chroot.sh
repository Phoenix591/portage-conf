function post_pkg_postinst() {
  if test "$CATEGORY/$PN" = "app-emulation/qemu"; then
        einfo "Updating /mnt/aarch64/usr/bin/qemu-aarch64"
        install -m 755 /usr/bin/qemu-aarch64 /mnt/aarch64/usr/bin/qemu-aarch64 || eerror "Failed to update /mnt/aarch64/usr/bin/qemu-aarch64"
        einfo "Rebuilding qemu-wrapper"
	gcc -static /var/tmp/portage/qemu-nonchroot-wrapper.c -O2 -s -o qemu-aarch64-nonchroot-wrapper
        install -m 755 /var/tmp/portage/qemu-aarch64-nonchroot-wrapper /usr/local/bin/qemu-aarch64-wrapper && \
        gcc -static -std=c99 -o /var/tmp/portage/qemu-aarch64-wrapper /var/tmp/portage/qemu-wrapper.c && \
        install -m 755 /var/tmp/portage/qemu-aarch64-wrapper /mnt/aarch64/usr/local/bin/qemu-aarch64-wrapper || eerror "Failed to update wrapper"
        einfo "Post install completed successfully"
 fi
}

