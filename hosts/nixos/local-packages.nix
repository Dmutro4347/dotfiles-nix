{ pkgs, ... }: {
	programs.firefox.enable = true;
  programs.nix-ld.enable = true;
	environment.systemPackages = with pkgs; [
     		wget
        zsh
     		ranger
     		git
     		tmux
     		ntfs3g
     		htop
     		home-manager
   	];
}
