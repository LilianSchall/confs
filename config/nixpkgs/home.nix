{ config, lib, pkgs, ... }:

with lib;

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "s3l4h";
  home.homeDirectory = "/home/s3l4h";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.zsh = {
      enable = true;
      oh-my-zsh = {
            enable = true;
            plugins = [ ];
            theme = "robbyrussell";
      };
      zplug = {
            enable = true;
            plugins = [
                { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
                { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
            ];
      };
	plugins = [
  	{
    		name = "powerlevel10k";
    		src = pkgs.zsh-powerlevel10k;
    		file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  	}
  	{
    		name = "powerlevel10k-config";
    		src = lib.cleanSource ~/p10k-config;
    		file = ".p10k.zsh";
  	}
	];
  };
    nixpkgs.config = {
        allowUnfree = true;
    };
    home.packages = with pkgs; [ discord ];

    services.polybar.enable = false;
    programs.vscode.enable = true;
}
