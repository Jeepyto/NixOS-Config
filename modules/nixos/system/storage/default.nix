{ lib, ... }:
{
  # NVMe/SSD I/O scheduler: kyber for low latency on fast NVMe drives,
  # bfq for fairness on rotational (mechanical) disks.
  hardware.block = {
    defaultScheduler           = "kyber";
    defaultSchedulerRotational = "bfq";
  };

  # Periodic TRIM for SSD/NVMe health and performance
  services.fstrim.enable = true;

  # ZRAM : swap compressé en RAM (zstd) style CachyOS
  zramSwap = {
    enable        = lib.mkDefault true;
    algorithm     = "zstd";
    memoryPercent = lib.mkDefault 100;
    priority      = 100;
  };

  # Règles udev
  services.udev.extraRules = ''
    ACTION=="change", KERNEL=="zram0", ATTR{initstate}=="1", SYSCTL{vm.swappiness}="150", RUN+="/bin/sh -c 'echo N > /sys/module/zswap/parameters/enabled'"
    ATTRS{name}=="Sony Interactive Entertainment Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ATTRS{name}=="Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
}
