# trace: warning: Shawn.OHare profile: The option `programs.git.userEmail' defined in `/nix/store/px67al31v4ra64cq1pa5n9jxkyl81a5g-source/home-manager/git.nix' has been renamed to `programs.git.settings.user.email'.
# trace: warning: Shawn.OHare profile: The option `programs.git.userName' defined in `/nix/store/px67al31v4ra64cq1pa5n9jxkyl81a5g-source/home-manager/git.nix' has been renamed to `programs.git.settings.user.name'.
{
  config,
  nixpkgs,
  pkgs,
  user,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user.name = "Shawn O'Hare";
      user.email = "shawn@shawnohare.com";
      alias = {
        df = "diff --color-words=. --ws-error-highlight=new,old";
        lg = "log --decorate";
        lga = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
        ls = "ls-files";
        new = "switch -c";
        root = "rev-parse --show-toplevel";
        st = "status";
        sv = "status --verbose";
        sw = "switch";
        unstage = "restore --staged";
        home = "!git --git-dir=\"\${HOME}/.git/\" --work-tree=\"\${HOME}\"";
      };

      # branch.autosetuprebase = "always";
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        interactive = "auto";
        ui = true;
        pager = true;
      };
      # core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "cache --timeout 604800";
      init = {
        defaultBranch = "master";
      };
      github = {
        user = "shawnohare";
      };
      push = {
        default = "tracking";
        autoSetupRemote = true;
      };
    };
  };
}
