{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    git
    grc
    docker
    nodejs
    lua
    luajitPackages.luarocks-nix
    sqlite
    claude-code
    jetbrains.pycharm
    python312
    uv
    python312Packages.virtualenv
  ];
}
