{
  flake.modules.nixos.locale = { config, ... }: {
    i18n.defaultLocale = config.profile.locale.default;
    i18n.extraLocaleSettings = config.profile.locale.extra;
  };
}
