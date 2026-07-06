{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    grimblast
    playerctl
    slurp
    wl-clipboard
    pywal
  ];
}
