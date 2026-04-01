{ pkgs, inputs, unstable, ... }: {
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Code / Dev
    gcc
    git
    grc
    nano
    jetbrains.pycharm
    ranger
    tmux
    tmuxinator
    tree
    docker
    nodejs
    lua
    luajitPackages.luarocks-nix
    sqlite

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
    pamixer
    pywal

    # System / CLI utils
    cmus
    bc
    gnupg
    htop
    jq
    killall
    microfetch
    onefetch
    ntfs3g
    pass
    pinentry-curses
    unzip
    wget
    qemu
    OVMF
    ripgrep

    # Python
    python312
    uv
    python312Packages.virtualenv

    # Cybersecurity
    # wireshark
    # burpsuite
    nmap
    # rustscan
    # metasploit
    # aircrack-ng
    # wifite2
    # wirelesstools
    # openvpn
    #
    # GUI apps
    qbittorrent
    kitty
    obsidian
    pavucontrol
    telegram-desktop
    virt-manager
    firefox
    anki
    unstable.komikku
    gimp
  ];
}
