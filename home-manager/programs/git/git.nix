{ pkgs, ...}:

{
  enable = true;

  # User config
  userName = "Lise Giraud";
  userEmail = "lise.giraud"+"@"+"epita"+"."+"fr";

  # Extra Config
  extraConfig = {
    core = {
      editor = "vim";
      core.pager = "${pkgs.delta}/bin/delta --dark";
    };
    init.defaultBranch = "main";
    pull.rebase = true;

    safe.directory = [ "/etc/nixos" ]; # Allow to push my config with git
  };

}
