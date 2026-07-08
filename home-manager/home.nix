{ homeStateVersion, user, ... }:
let
  paths = import ./modules/paths.nix;
in
{
  imports = [
    (paths.packages + "/cli-tools.nix")
    (paths.packages + "/desktop-apps.nix")
    (paths.packages + "/dev-tools.nix")
    (paths.packages + "/wm-tools.nix")
    # (paths.packages + "/spicetify.nix")
    (paths.desktop + "/hyprland")
    (paths.desktop + "/dunkshell.nix")
    (paths.development + "/git.nix")
    (paths.development + "/gpg-agent.nix")
    (paths.development + "/nvchad.nix")
    (paths.shell + "/kitty.nix")
    (paths.shell + "/stylix.nix")
    (paths.shell + "/ranger.nix")
    (paths.shell + "/tmux.nix")
    (paths.shell + "/tmuxinator.nix")
    (paths.shell + "/zsh.nix")

  ];
  home = {
    username = "arfors";
    homeDirectory = "/home/arfors";
    stateVersion = "25.05";
  };
}
