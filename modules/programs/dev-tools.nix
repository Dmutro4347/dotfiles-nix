{
  flake.modules.homeManager.dev-tools =
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
        python312
        uv
        python312Packages.virtualenv
      ];
    };
}
