{ config, pkgs, ... }:

{
  home.username = "noel";
  home.homeDirectory = "/home/noel";

  # Do not change this value, even if you update Home Manager.
  home.stateVersion = "23.05";


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zprofile".source = ./dotfiles/zsh/zprofile;
    ".zshrc".source = ./dotfiles/zsh/zshrc;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/noel/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "emacs";
    PAGER = "less";

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
