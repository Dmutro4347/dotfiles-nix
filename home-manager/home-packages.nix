{ pkgs, inputs, unstable, ... }: {
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Code / Dev
    gcc
    git
    grc
    nano
    jetbrains.pycharm-professional
    ranger
    tmux
    tmuxinator
    tree
    docker
    nodejs
    lua
    luajitPackages.luarocks-nix

    # Hyprland / WM
    brightnessctl
    cliphist
    grimblast
    playerctl
    slurp
    swww
    waypaper
    wl-clipboard
    wofi

    # System / CLI utils
    bc
    gnupg
    htop
    jq
    killall
    microfetch
    ntfs3g
    pass
    pinentry-curses
    unzip
    wget
    qemu
    ripgrep

    # Python
    python312
    python312Packages.pip
    python312Packages.virtualenv

    # GUI apps
    qbittorrent
    kitty
    obsidian
    pavucontrol
    spotify
    telegram-desktop
    virt-manager
    firefox
    anki
    unstable.komikku
  ];
}
