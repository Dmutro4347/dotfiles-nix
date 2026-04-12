{ pkgs, ... }: {
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    zsh
    ranger
    git
    tmux
    ntfs3g
    htop
    home-manager
  ];
}
