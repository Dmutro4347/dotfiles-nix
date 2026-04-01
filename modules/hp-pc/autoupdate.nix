{
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/arfors/flake"; # твій флейк
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
    dates = "weekly"; # раз на тиждень
    randomizedDelaySec = "1h";
  };
}

