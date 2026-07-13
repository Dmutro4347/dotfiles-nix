{

  flake.modules.homeManager.git = { config, ... }: {
    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            email = config.profile.email;
            name = config.profile.fullName;

          };
          pull.rebase = true;
        };
      };
    };
  };
}
