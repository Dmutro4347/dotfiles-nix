{ config, pkgs, ... }:
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql; # або 15/14 якщо потрібна конкретна версія
    dataDir = "/var/lib/postgresql/17"; # шлях до бази
    enableTCPIP = true; # дозволити мережеві підключення
    # superuser створюється автоматично з ім’ям postgres
  };

  # Додамо утиліти psql
  environment.systemPackages = with pkgs; [
    postgresql
    dbeaver-bin
  ];
}
