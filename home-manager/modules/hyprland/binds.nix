{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod SHIFT, Return, exec, $terminal"
      "$mainMod SHIFT, Q, killactive,"
      "$mainMod SHIFT, E, exec, wlogout"
      "$mainMod SHIFT, B, exec, $browser"
      "$mainMod SHIFT, T, exec, $massanger"
      "$mainMod SHIFT, W, exec, waypaper"
      "$mainMod,       F, togglefloating,"
      "$mainMod SHIFT, R, exec, $menu --show drun"
      "$mainMod,       P, pseudo,"
      "$mainMod,       T, togglesplit,"
      "$mainMod,       N, exec, swaync-client -t"
      "$mainMod,       V, exec, cliphist list | $menu --dmenu | cliphist decode | wl-copy"
      ", Print, exec, grimblast --notify --freeze copysave area"

      # Moving focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      # Moving windows
      "$mainMod SHIFT, left,  movewindow, l"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, up,    movewindow, u"
      "$mainMod SHIFT, down,  movewindow, d"
      "$mainMod SHIFT, h, movewindow, l"
      "$mainMod SHIFT, l, movewindow, r"
      "$mainMod SHIFT, k, movewindow, u"
      "$mainMod SHIFT, j, movewindow, d"

      # Resizeing windows                   X  Y
      "$mainMod CTRL, left,  resizeactive, -50 0"
      "$mainMod CTRL, right, resizeactive,  50 0"
      "$mainMod CTRL, up,    resizeactive,  0 -50"
      "$mainMod CTRL, down,  resizeactive,  0  50"

      "$mainMod CTRL, H, resizeactive,-50 0"
      "$mainMod CTRL, L, resizeactive,50 0"
      "$mainMod CTRL, K, resizeactive,0 -50"
      "$mainMod CTRL, J, resizeactive,0 50"

      # Switching workspaces
      "$mainMod, 1, split:workspace, 1"
      "$mainMod, 2, split:workspace, 2"
      "$mainMod, 3, split:workspace, 3"
      "$mainMod, 4, split:workspace, 4"
      "$mainMod, 5, split:workspace, 5"
      "$mainMod, 6, split:workspace, 6"
      "$mainMod, 7, split:workspace, 7"
      "$mainMod, 8, split:workspace, 8"
      "$mainMod, 9, split:workspace, 9"
      "$mainMod, 0, split:workspace, 10"

      # Moving windows to workspaces
      "$mainMod SHIFT, 1, split:movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, split:movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, split:movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, split:movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, split:movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, split:movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, split:movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, split:movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, split:movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, split:movetoworkspacesilent, 10"

      # Scratchpad
      "$mainMod,       S, togglespecialworkspace,  magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm =
      [ "$mainMod, mouse:272, movewindow" "$mainMod, mouse:273, resizewindow" ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ",XF86AudioRaiseVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
    ];

    # Audio playback
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
