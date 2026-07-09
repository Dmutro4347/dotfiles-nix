{
  flake.modules.nixos.greetd = { pkgs, ... }: {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "arfors";
        };
        # terminal = { vt = 7; };
      };
    };
    systemd.services.greetd = {
      serviceConfig = {
        Type = "idle";
        ExecStartPre = [ "${pkgs.procps}/bin/kill -s RTMIN+21 1" ];
        ExecStopPost = [ "${pkgs.procps}/bin/kill -s RTMIN+20 1" ];
      };
    };
  };
}
