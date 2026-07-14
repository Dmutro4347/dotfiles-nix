{
  flake.modules.homeManager.fish =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set -gx NIX_LD (nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; in pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"')
          set -gx PULSE_NO_GAIN 1
          set fish_greeting
          if test -z "$TMUX"; and test -n "$WAYLAND_DISPLAY$DISPLAY"
            tmux attach-session -t default; or tmux new-session -s default
          end
        '';
        shellAliases = {
          sw = "nh os switch";
          upd = "nh os switch --update";
          hms = "nh home switch";
          pkgs = "nvim /home/arfors/flake/home-manager/home-packages.nix";
          r = "ranger";
          vi = "nvim";
          microfetch = "microfetch && echo";
          gs = "git status";
          ga = "git add";
          gc = "git commit";
          gp = "git push";
          ".." = "cd ..";
        };
        plugins = [
          # нативний fish-порт теми robbyrussell (oh-my-zsh) — не в nixpkgs, тягнемо напряму
          {
            name = "theme-robbyrussell";
            src = pkgs.fetchFromGitHub {
              owner = "oh-my-fish";
              repo = "theme-robbyrussell";
              rev = "master";
              sha256 = "sha256-l/fctaS58IZKM5/MsYC+WQZ0GWZGZ6SWT+bA5QoODbU=";
            };
          }
        ];
      };
      programs.fzf = {
        enable = true;
        enableFishIntegration = true; # замінює ручний source key-bindings.fzf/completion.fzf
      };
    };
}
