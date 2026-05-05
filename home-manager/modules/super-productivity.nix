{ pkgs, ... }:
let
  super-productivity = pkgs.appimageTools.wrapType2 rec {
    pname = "super-productivity";
    version = "18.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/super-productivity/super-productivity/releases/download/v${version}/superProductivity-x86_64.AppImage";
      hash = "sha256:e3703cfcb754ed2ce58a35f276e3d90577c12224b3585e7c763ea8a9139b59c7";
    };
    extraInstallCommands =
      let
        contents = pkgs.appimageTools.extractType2 { inherit pname version src; };
      in
      ''
        install -m 444 -D ${contents}/superproductivity.desktop \
          $out/share/applications/superproductivity.desktop
        install -m 444 -D ${contents}/usr/share/icons/hicolor/256x256/apps/superproductivity.png \
          $out/share/icons/hicolor/256x256/apps/superproductivity.png
        substituteInPlace $out/share/applications/superproductivity.desktop \
          --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${pname} %U'
      '';
  };
in
{
  home.packages = [ super-productivity ];
}
