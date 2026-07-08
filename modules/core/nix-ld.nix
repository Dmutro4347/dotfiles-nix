{
  flake.modules.core.nix-ld = { pkgs, ... }: {
    programs.nix-ld = {
      enable = true;

      libraries = with pkgs; [
        # 🧩 базові системні бібліотеки
        stdenv.cc.cc
        zlib
        openssl
        glib
        dbus
        curl
        libnotify
        libuuid
        libsecret

        # 🎨 GTK / GDK
        gtk3
        gdk-pixbuf
        pango
        cairo
        at-spi2-core
        at-spi2-atk

        # 🪟 Wayland
        wayland
        libxkbcommon
        wlroots
        libdrm
        mesa
        libGL
        vulkan-loader
        vulkan-validation-layers

        # 🔊 PipeWire / аудіо
        pipewire
        wireplumber
        alsa-lib
        pulseaudio

        # 💡 XWayland fallback (деякі AppImage це потребують)
        xorg.libX11
        xorg.libXcursor
        xorg.libXi
        xorg.libXrandr
        xorg.libXext
        xorg.libXfixes
        xorg.libXrender
        xorg.libXinerama
      ];
    };
  };
}
