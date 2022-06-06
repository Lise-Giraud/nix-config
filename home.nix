{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
  feather-icons = builtins.fetchurl { 
    url = "https://github.com/adi1090x/polybar-themes/blob/46154c5283861a6f0a440363d82c4febead3c818/fonts/panels/icomoon_feather.ttf?raw=true";
    sha256 = "d74dc222a0ee04ebd2a169fed8eb437692a98833c06534f5450400fd024a9bbb";
  };
in
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./battery.nix
    ./discord.nix
    ./polybar/shapes/default.nix
  ];

  home.packages = with pkgs; [
    # Overview
    htop
    neofetch
    feh
    gnupg
    netcat
    tree
    pstree
    man-pages
    zsh

     # Tools
    i3lock-fancy
    pavucontrol
    arandr
    networkmanagerapplet
    xfce.thunar
    zip
    wdiff
    unzip
    gtk3-x11
    flameshot
    valgrind
    flex
    postgresql
    gnome.gnome-bluetooth
    gtest
    bison

    # Dev tools
    clang-tools
    (hiPrio gcc) 
    cmake
    gnumake
    gdb
    any-nix-shell
    gitAndTools.gitflow
    nodejs
    jetbrains.idea-ultimate
    vscode-with-extensions
    curl
    p7zip
    #libtensorflow-bin
    #jupyter
    #python38Packages.bottleneck
    sbcl #lisp compiler
    python38
    maven #Java compiler
    postman
    docker
    docker-compose
    nlohmann_json #json parser


    # 4 school
    jetbrains.clion
    #teams
    jetbrains.pycharm-community
    #jetbrains.webstorm
    bintools-unwrapped
    thunderbird
    jdk
  

    # Fonts
    unstable.font-awesome
    #feather

    # Fun
    spotify
    #brave
    firefox
    discord
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "Lise";
  home.homeDirectory = "/home/lise";

  services = {
      picom.enable = true;
  };


  programs = {
    home-manager.enable = true;
    neovim = import ./nvim.nix { inherit pkgs; };
    fish = import ./fish.nix { inherit pkgs; };
    alacritty = import ./alacritty.nix { inherit pkgs; };
    rofi = import ./rofi/rofi.nix { inherit pkgs; inherit config; };
    starship = import ./starship/starship.nix;

    git = {
      enable = true;
      userName = "Lise Giraud";
      userEmail = "lise.giraud"+"@"+"epita"+"."+"fr";
    };
  };

  fonts.fontconfig.enable = true;

    gtk = {
      enable = true;
      iconTheme = {
        name = "BeautyLine";
        package = pkgs.beauty-line-icon-theme;
      };
      theme = {
        name = "Juno-ocean";
        package = pkgs.callPackage ./juno {};
      };
    };

  xsession.windowManager.i3 = import ./i3.nix {inherit pkgs lib; };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
