{ config, pkgs, ... }:

{
  imports =
    [
      /mnt/etc/nixos/hardware-configuration.modified.nix
    ];

  networking.hostName = "nixos";
  networking.wireless.enable = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Australia/Sydney";

  nix.nixPath = [
    "nixos-config=/home/u/dots/nixos/config.nix"
    "nixpkgs=/home/u/nixpkgs"
  ];

  environment.systemPackages = with pkgs; [
    # The packages that ../bootstrap script needs.
    git
    stow
  ];

  users.extraUsers.u = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    uid = 1000;
  };
}
