{
  flake.modules.nixos.fingerprint = {
    services.fprintd.enable = true;

    security.sudo.enable = true;

    security.pam.services.sudo.fprintAuth = true;
    # security.pam.services.login.fprintAuth = true;
    # security.pam.services.su.fprintAuth = true;
    # security.pam.services.polkit-1.fprintAuth = true;
    security.pam.services.dank-greeter.fprintAuth = true;

    # якщо треба для greeter, додай його окремо як PAM-сервіс,
    # але не через security.pam.services.services.*
  };
}
