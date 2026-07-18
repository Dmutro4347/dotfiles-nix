{
  flake.modules.nixos.nh = { config, ... }: {
    programs.nh = {
      enable = true;
      flake = "/home/${config.primaryUser}/flake";
    };
  };
}
