#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:f29be31c6a1a86437e0f977525fe3cdb492256bc; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:143c1ef6b6b61b30dda1c22e2ba5759d883ccba6 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:f29be31c6a1a86437e0f977525fe3cdb492256bc && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
