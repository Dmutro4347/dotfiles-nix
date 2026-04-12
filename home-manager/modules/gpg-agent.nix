{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;

    defaultCacheTtl = 1800; # 30 хв
    maxCacheTtl = 7200; # 2 години

    enableSshSupport = true;

    # Для Hyprland (Wayland)
    pinentry.package = pkgs.pinentry-tty;
  };
}
