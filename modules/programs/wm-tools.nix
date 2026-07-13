{
  flake.modules.homeManager.wm-tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        brightnessctl
        cliphist
        playerctl
        wl-clipboard
        pywal
        xwayland-satellite
      ];
    };
}
