{ pkgs, lib, ... }:

{
  enable = true;

  settings = {
    format =
      let
        git = "$git_branch$git_commit$git_state$git_status";
      in
      ''
        $directory(${git}) $fill $time
        $jobs$character
      '';


    fill = {
      symbol = " ";
      disabled = false;
    };

    # Core
    username = {
      format = "[$user]($style)";
      show_always = true;
    };
    hostname = {
      format = "[@$hostname]($style) ";
      ssh_only = false;
      style = "bold green";
    };
    shlvl = {
      format = "[$shlvl]($style) ";
      style = "bold cyan";
      threshold = 2;
      repeat = true;
      disabled = false;
    };
    cmd_duration = {
      format = "took [$duration]($style) ";
    };

    directory = {
      format = "[$path]($style)( [$read_only]($read_only_style)) ";
      #format = "[]($style)[(bg:#89b4fa fg:#49628a)$path](bg:#89b4fa fg:#49628a)[] ($style)";
      #      style = "bg:#1a1b26 fg:#89b4fa";
    };
    nix_shell = {
      format = "[($name \\(develop\\) <- )$symbol]($style) ";
      impure_msg = "";
      symbol = " ";
      style = "bold red";
    };
    custom = {
      nix_inspect =
        let
          excluded = [
            "kitty"
            "imagemagick"
            "ncurses"
            "user-environment"
          ];
        in
        {
          disabled = false;
          when = "test -z $IN_NIX_SHELL";
          #command = "${(lib.getExe pkgs.nix-inspect)} ${(lib.concatStringsSep " " excluded)}";
          format = "[($output <- )$symbol]($style) ";
          symbol = " ";
          style = "bold blue";
        };
    };

    #    git_branch = {
    #      format = "[]($style)[[ ](bg:#89b4fa fg:#49628a bold)$branch](bg:#89b4fa fg:#4c4f69)[ ]($style)";
    #      style = "bg:#1a1b26 fg:#89b4fa";
    #    };

    character = {
      error_symbol = "[~~>](bold red)";
      success_symbol = "[->>](bold green)";
      vimcmd_symbol = "[<<-](bold yellow)";
      vimcmd_visual_symbol = "[<<-](bold cyan)";
      vimcmd_replace_symbol = "[<<-](bold purple)";
      vimcmd_replace_one_symbol = "[<<-](bold purple)";

      #      success_symbol = "[🞈](#a6e3a1 bold)";
      #      error_symbol = "[🞈](#f38ba8)";
      #      vicmd_symbol = "[🞈](#f9e2af)";
    };

    time = {
      format = "\\\[[$time]($style)\\\]";
      disabled = false;
    };

    # Icon changes only \/
    aws.symbol = "  ";
    conda.symbol = " ";
    dart.symbol = " ";
    directory.read_only = " ";
    docker_context.symbol = " ";
    elixir.symbol = " ";
    elm.symbol = " ";
    gcloud.symbol = " ";
    git_branch.symbol = " ";
    golang.symbol = " ";
    hg_branch.symbol = " ";
    java.symbol = " ";
    julia.symbol = " ";
    memory_usage.symbol = "󰍛 ";
    nim.symbol = "󰆥 ";
    nodejs.symbol = " ";
    package.symbol = "󰏗 ";
    perl.symbol = " ";
    php.symbol = " ";
    python.symbol = " ";
    ruby.symbol = " ";
    rust.symbol = " ";
    scala.symbol = " ";
    shlvl.symbol = "";
    swift.symbol = "󰛥 ";
    terraform.symbol = "󱁢";
  };
}
