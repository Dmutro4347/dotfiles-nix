{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pinentry-curses
    bc
    gnupg
    htop
    jq
    killall
    microfetch
    onefetch
    # ntfs3g # ?
    pass
    unzip
    wget
    # qemu # ?
    # OVMF # ?
    ripgrep
    ranger
    tmux
    tmuxinator
    tree
  ];
}
