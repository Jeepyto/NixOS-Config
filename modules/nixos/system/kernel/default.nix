{ pkgs, lib, ... }:
{
  # ── Kernel CachyOS (LTS, v3) ──────────────────────────────────────────
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  # ntsync : primitives de sync Wine/Proton plus rapides (remplace esync/fsync)
  # tcp_bbr : module BBR (sysctl correspondant ci-dessous)
  boot.kernelModules = [ "ntsync" "tcp_bbr" ];

  # amd_pstate=active : driver natif AMD de scaling fréquence CPU (Ryzen)
  boot.kernelParams = [ "amd_pstate=active" ];

  # ZRAM compressed swap in RAM (CachyOS-style config) for fast,
  # memory-efficient swap instead of relying on disk swap.
  boot.kernel.sysctl = {
    # ── MÉMOIRE ──
    "vm.swappiness"                = 100;  # gardé à 100 car ZRAM
    "vm.vfs_cache_pressure"        = 50;
    "vm.dirty_bytes"               = 268435456;
    "vm.dirty_background_bytes"    = 67108864;
    "vm.dirty_writeback_centisecs" = 1500;
    "vm.page-cluster"              = 0;
    "vm.max_map_count"             = 16777216;

    # ── KERNEL ──
    "kernel.split_lock_mitigate" = 0;
    "kernel.nmi_watchdog"        = 0;
    "kernel.printk"              = "3 3 3 3";
    "kernel.kptr_restrict"       = 2;
    "kernel.kexec_load_disabled" = 1;
    "kernel.sched_rt_runtime_us" = 950000;

    # ── RÉSEAU (latence/débit gaming) ──
    "net.core.default_qdisc"             = "cake";
    "net.ipv4.tcp_congestion_control"    = "bbr";
    "net.ipv4.tcp_fastopen"              = 3;
    "net.ipv4.tcp_mtu_probing"           = 1;
    "net.ipv4.tcp_slow_start_after_idle" = 0;
    "net.ipv4.tcp_tw_reuse"              = 1;
    "net.core.netdev_max_backlog"        = 16384;
    "net.core.somaxconn"                 = 8192;
  };
}
