{
  flake.modules.nixos.graphics = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true; # потрібно для Steam і 32-бітних Vulkan/OpenGL лібів
    };
  };
}
