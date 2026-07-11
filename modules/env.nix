{
  flake.modules.nixos.env = {
    environment.sessionVariables = rec {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [
        "${XDG_BIN_HOME}"
      ];
    };
  };
}
