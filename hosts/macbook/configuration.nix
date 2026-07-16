{ pkgs, ... }:

{
  imports = [
    ../../features
  ];

  users.users.goose = {
    description = "Johnny Urosevic";
    home = "/Users/goose";
    shell = pkgs.zsh;
    uid = 501;
  };
  system.primaryUser = "goose";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "America/Los_Angeles";

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;

  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.NewWindowTarget = "Home";
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder._FXSortFoldersFirst = true;
  system.defaults.finder.QuitMenuItem = true;

  system.stateVersion = 7;
}
