{
  flake.modules.nixos.timezone = { config, ... }: {
    time.timeZone = config.profile.timezone;
  };
}
