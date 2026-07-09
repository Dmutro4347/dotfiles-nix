{
  flake.modules.generic.primaryUserHome =
    {
      config,
      pkgs,
      system,
      inputs,

      ...
    }:
    {
      home-manager.users.${config.primaryUser} = {
        # extraSpecialArgs = {
        #   inherit
        #     system
        #     inputs
        #     ;
        # };
        programs.home-manager.enable = true;
        home = {
          username = config.primaryUser;
          homeDirectory = "/home/${config.primaryUser}";
          stateVersion = "26.05";
        };
      };
    };
}
