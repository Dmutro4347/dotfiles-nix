{
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/arfors/flake";
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
    dates = "weekly";
    randomizedDelaySec = "1h";
  };
}

