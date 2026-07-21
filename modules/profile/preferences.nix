{
  flake.modules.generic.profile =
    {
      lib,
      pkgs,
      ...
    }:
    {
      options.profile = lib.mkOption {
        readOnly = true;
        type = lib.types.submodule {
          options = {
            email = lib.mkOption { type = lib.types.str; };
            fullName = lib.mkOption { type = lib.types.str; };
            avatar = lib.mkOption { type = lib.types.path; };
            timezone = lib.mkOption { type = lib.types.str; };
            locale = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  default = lib.mkOption { type = lib.types.str; };
                  extra = lib.mkOption { type = lib.types.attrsOf lib.types.str; };
                };
              };
            };
          };
        };
      };

      config.profile = {
        email = "dmutrobui@gmail.com";
        fullName = "Dmytro Bui";
        avatar = ./ava.jpg;

        timezone = "Europe/Kiev";
        locale = {
          default = "en_US.UTF-8";
          extra = {
            LC_ADDRESS = "uk_UA.UTF-8";
            LC_IDENTIFICATION = "uk_UA.UTF-8";
            LC_MEASUREMENT = "uk_UA.UTF-8";
            LC_MONETARY = "uk_UA.UTF-8";
            LC_NAME = "uk_UA.UTF-8";
            LC_NUMERIC = "uk_UA.UTF-8";
            LC_PAPER = "uk_UA.UTF-8";
            LC_TELEPHONE = "uk_UA.UTF-8";
            LC_TIME = "uk_UA.UTF-8";
          };
        };
      };
    };
}
