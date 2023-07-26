{ inputs, system, config, pkgs, lib, ... }:

let
  colors = import ./colorscheme.nix;
  feather-icons = builtins.fetchurl {
    url = "https://github.com/adi1090x/polybar-themes/blob/46154c5283861a6f0a440363d82c4febead3c818/fonts/panels/icomoon_feather.ttf?raw=true";
    sha256 = "d74dc222a0ee04ebd2a169fed8eb437692a98833c06534f5450400fd024a9bbb";
  };
in
  {
    imports = [
      ./services/battery.nix
      ./discord.nix
      #./programs/polybar/polybar.nix
    ];

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "lise";
    home.homeDirectory = "/home/lise";

    home.packages = with pkgs; [
      # Overview
      htop
      neofetch
      feh
      gnupg
      #netcat
      tree
      pstree
      man-pages
      #zsh
      dunst
      swww
      playerctl

      # Tools
      betterlockscreen
      pavucontrol
      arandr
      networkmanagerapplet
      xfce.thunar
      #zip
      wdiff
      #unzip
      gtk3-x11
      #flameshot
      #gnome.gnome-bluetooth
      #libreoffice
      #shutter
      sway-contrib.grimshot
      slurp
      wl-clipboard
      libnotify
      curl
      p7zip
      firefox
      #kicad

      # Dev tools
      valgrind
      #flex
      #postgresql
      #gtest
      #bison
      clang-tools
      (hiPrio gcc)
      cmake
      gnumake
      gdb
      any-nix-shell
      gitAndTools.gitflow
      nodejs_20
      jetbrains.idea-ultimate
      #libtensorflow-bin
      jupyter
      #python38Packages.bottleneck
      #sbcl #lisp compiler
      python38
      maven #Java compiler
      postman
      docker
      docker-compose
      #nlohmann_json #json parser
      #javaPackages.openjfx17
      #scenebuilder
      vscode
      #dbeaver
      #mariadb #new version of mysql
      #mysql-client
      #sqlitebrowser
      jetbrains.rider
      dotnet-sdk_7
      #yarn
      poetry
      #stm32cubemx
      #stlink
      github-copilot-intellij-agent
      jq

      # 4 school
      jetbrains.clion
      #teams
      jetbrains.pycharm-professional
      jetbrains.webstorm
      bintools-unwrapped
      thunderbird
      jdk
      #slack

      # Fonts
      #unstable.font-awesome
      #feather
      fira-code
      iosevka
      fira-code-symbols
      nerdfonts

      # Fun
      discord
      spotify
    ];

    fonts.fontconfig.enable = true;

    programs = {
      home-manager.enable = true;
      neovim = import ./programs/nvim/nvim.nix { inherit pkgs; };
      fish = import ./programs/fish/fish.nix { inherit pkgs; };
      alacritty = import ./programs/alacritty/alacritty.nix { inherit pkgs colors; };
      rofi = import ./programs/rofi/rofi.nix { inherit pkgs; inherit config; };
      starship = import ./programs/starship/starship.nix;
      git = import ./programs/git/git.nix { inherit pkgs; };
      waybar = import ./programs/waybar { inherit pkgs; inherit lib; };
    };

    services = {
        picom = import ./services/picom/picom.nix;
        betterlockscreen = import ./services/betterlockscreen/betterlockscreen.nix;
    };

    gtk = {
      enable = true;
      iconTheme = {
        name = "BeautyLine";
        package = pkgs.beauty-line-icon-theme;
      };
      theme = {
        name = "Juno-ocean";
        package = pkgs.callPackage ./programs/juno {};
      };
    };

    xsession.windowManager.i3 = import ./programs/i3/i3.nix {inherit pkgs lib; };
    wayland.windowManager.hyprland = import ./programs/hyprland { inherit pkgs; };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";
  }
