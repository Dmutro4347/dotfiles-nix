{
  flake.modules.homeManager.cli-tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        pinentry-curses
        bc
        gnupg
        htop
        jq
        killall
        microfetch
        onefetch
        pass
        unzip
        wget
        ripgrep
        ranger
        tmux
        tmuxinator
        tree
        autojump
        fd
        neovim

      ];

      programs.ranger = {
        enable = true;
        mappings = {
          e = "edit";

          ec = "compress";
          ex = "extract";

          b = "fzm";
        };

        settings = {
          preview_images = true;
          preview_images_method = "kitty";
          draw_borders = true;
          w3m_delay = 0;
        };

        extraConfig = ''
          default_linemode devicons2
        '';
        plugins = [
          {
            name = "ranger-archives";
            src = builtins.fetchGit {
              url = "https://github.com/maximtrp/ranger-archives";
              ref = "master";
              rev = "b4e136b24fdca7670e0c6105fb496e5df356ef25";
            };
          }
          {
            name = "ranger-devicons2";
            src = builtins.fetchGit {
              url = "https://github.com/cdump/ranger-devicons2";
              ref = "master";
              rev = "94bdcc19218681debb252475fd9d11cfd274d9b1";
            };
          }
          {
            name = "ranger_tmux";
            src = builtins.fetchGit {
              url = "https://github.com/joouha/ranger_tmux";
              ref = "master";
              rev = "05ba5ddf2ce5659a90aa0ada70eb1078470d972a";
            };
          }
        ];
      };

      home.file.".config/ranger/commands.py".text = "from plugins.ranger_udisk_menu.mounter import mount";
      programs.tmux = {
        enable = true;
        baseIndex = 1;
        mouse = true;
        escapeTime = 0;
        keyMode = "vi";
        terminal = "tmux-256color";

        plugins = with pkgs; [
          tmuxPlugins.vim-tmux-navigator
          tmuxPlugins.resurrect
          tmuxPlugins.continuum
          tmuxPlugins.sessionist
          tmuxPlugins.yank
        ];

        extraConfig = ''
                    # --- General ---
                    set -g prefix C-a
                    unbind C-b
                    set -g history-limit 10000
                    set -g set-titles on
                    set -g renumber-windows on
                    setw -g automatic-rename on
                    set -sg repeat-time 600
                    set -s focus-events on
                    set-option -g set-clipboard on
          # --- Copy mode (vi) ---
                    # setw -g mode-keys vi
                    # bind -T copy-mode-vi v send-keys -X begin-selection
                    # bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
                    # bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
                    # bind -T copy-mode-vi Escape send-keys -X cancel
                    # bind -T copy-mode-vi H send-keys -X start-of-line
                    # bind -T copy-mode-vi L send-keys -X end-of-line
                    #
                    # --- Reload config ---
                    bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

                    # --- Splits ---
                    bind - split-window -v
                    bind | split-window -h

                    # --- Pane navigation ---
                    bind -r h select-pane -L
                    bind -r j select-pane -D
                    bind -r k select-pane -U
                    bind -r l select-pane -R
                    bind > swap-pane -D
                    bind < swap-pane -U

                    # --- Pane resizing ---
                    bind -r H resize-pane -L 2
                    bind -r J resize-pane -D 2
                    bind -r K resize-pane -U 2
                    bind -r L resize-pane -R 2

                    # --- Window navigation ---
                    bind -r C-h previous-window
                    bind -r C-l next-window
                    bind -r C-S-H swap-window -t -1 \; select-window -t -1
                    bind -r C-S-L swap-window -t +1 \; select-window -t +1
                    bind Tab last-window

                    # --- Session management ---
                    bind C-c new-session
                    bind C-f command-prompt -p find-session 'switch-client -t %%'
                    bind BTab switch-client -l
                    bind q kill-pane
                    bind Q kill-window
                    bind e kill-session

                    # --- Buffers ---
                    bind b list-buffers
                    bind p paste-buffer -p
                    bind P choose-buffer


                    # --- Mouse ---
                    bind m set -g mouse \; \
                    display-message "Mouse mode: #{?mouse,on,off}"

                    # --- Bar ---
                    set -g status-justify centre
                    set -g status-left-length 40
                    set -g status-right-length 120
                    set -g status-style none

                    set -g status-left "#S #[dim]| #[bright]#I:#W "
                    set -g status-right "#[dim] #[bright] %H:%M"

                    setw -g window-status-current-format "#[reverse] #I #[bold]#W #[reverse] #[default]"
                    setw -g window-status-format " #[dim] #I #W #[default]"

                    # --- Plugins config ---
                    set -g @resurrect-capture-pane-contents 'on'
                    set -g @continuum-restore 'on'
        '';
      };
    };

}
