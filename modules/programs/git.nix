{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Dmutro4347";
          email = "dmutrobui@gmail.com";
        };
      };
    };
  };
}
