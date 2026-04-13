{ pkgs, inputs, unstable, ... }: {
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Code / Dev
    gcc
    git
    grc
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
    claude-code
    lmstudio

    # Hyprland / WM
    brightnessctl
    cliphist
    grimblast
    playerctl
    slurp
    wl-clipboard
    pywal

    # System / CLI utils
    pinentry-curses
    bc
    gnupg
    htop
    jq
    killall
    microfetch
    onefetch
    ntfs3g
    pass
    unzip
    wget
    qemu
    OVMF
    ripgrep
    nvtopPackages.nvidia
    yt-dlp

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
    # pavucontrol
    telegram-desktop
    virt-manager
    firefox
    # anki
    # unstable.komikku
    # gimp
  ];
}
