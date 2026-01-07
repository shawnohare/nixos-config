# The main home-manager configuration file used by most "profiles". Equivalent
# to the ~/.config/home-manager/home.nix file generated in a stand-alone
# home-manager install.
{
  pkgs,
  lib,
  config,
  target,
  ...
}: let
  homebrew_prefix = "/opt/homebrew";
  local_bin = "$HOME/.local/bin";
in {
  imports = [
    ./readline.nix
    ./git.nix
    ./starship.nix
    ./eza.nix
    ./zsh.nix
    ./bash.nix
    ./tmux.nix
  ];

  # Home Manager needs a bit of information about the paths it should manage.
  home.username = lib.mkDefault "${target.user.name}";
  home.homeDirectory = lib.mkDefault (
    if pkgs.stdenv.isDarwin
    then "/Users/${config.home.username}"
    else "/home/${config.home.username}"
  );

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = lib.mkDefault "${target.home.stateVersion}";
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.packages =
    with pkgs; [
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      _1password-cli
      hello

      alejandra
      awscli2
      bash
      bandwhich
      bat # cat clone
      bottom # not top
      cachix
      coreutils-prefixed
      carapace # cross-shell completions
      ctags
      curl
      delta # diff
      devbox # global and per project dep manager.
      direnv #
      dust # du + rust = dust
      # entr
      eza # maintained version of exa.
      fastmod
      fd
      fish
      # gcc
      gh # github cli client
      git
      glow
      helix # editor
      htop
      hyperfine # benchmarking
      jq
      lazygit
      miller
      moreutils
      mosh
      # micromamba # NOTE: Had issues, but devbox version seems fine.
      # neovim  # NOTE: Managed through devbox.
      ncurses
      nixfmt-rfc-style
      nushell
      pandoc
      procs # ps replacement
      q-text-as-data
      ripgrep
      # rustup # NOTE: Seems to cause issues, such as mixing libs. Checkout fenix?
      shellcheck
      sd # simple sed
      starship
      tealdeer
      tectonic
      tmux
      tokei
      uutils-coreutils
      wget
      zoxide # like z
      zellij # terminal multiplexer
      zsh

      # fonts
      nerd-fonts.jetbrains-mono

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ]
    # On macOS, a nix provided clang will fail to link many Apple SDK
    # components. This can cause build issues, e.g., when using cargo.
    # One approach is to export PATH=/usr/bin:$PATH when building when cargo
    # NOTE: These sdk frameworks are stubs in 25.05?
    # ++ (
    #   if pkgs.stdenv.isDarwin
    #   # NOTE: We did encounter an issue with the QuickTime framework being
    #   # unavailable.
    #   # then (builtins.attrValues darwin.apple_sdk.frameworks)
    #   then with darwin.apple_sdk.frameworks; [IOKit]
    #   else []
    # )
    ;

  # Home Manager can symlink user config files. The primary way to manage
  # plain files is through 'home.file',
  home.file = {
    # ".config/" = {
    #   recursive = true;
    #   source = ./etc/config;
    # };
    ".config/ipython/profile_default/ipython_config.py".source = ./etc/ipython/config.py;
    ".local/bin" = {
      recursive = true;
      source = ./bin;
    };
    ".local/bin/switch".source = ../switch;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  # NOTE: The shell must be managed by home-manager for env vars and aliases
  # to be available.
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    CARGO_HOME = "${config.xdg.stateHome}/cargo";
    CLICOLOR = "1";
    DOOMDIR = "${config.xdg.configHome}/doom";
    EDITOR = "nvim";
    GOPATH = "${config.xdg.stateHome}/go";
    HOMEBREW_BOOTSNAP = 1;
    HOMEBREW_CELLAR = /opt/homebrew/Cellar;
    HOMEBREW_NO_ANALYTICS = 1;
    # HOMEBREW_NO_AUTO_UPDATE = 1;
    HOMEBREW_PREFIX = /opt/homebrew;
    HOMEBREW_REPOSITORY = /opt/homebrew;
    IPYTHONDIR = "${config.xdg.configHome}/ipython";
    LESS = "-Mr";
    LESSHISTFILE = "${config.xdg.stateHome}/less/history";
    LISTLINKS = 1;
    # LS_COLORS handled by dircolors module.
    # LS_COLORS = "ExGxBxDxCxEgEdxbxgxcxd";
    MAMBARC = "${config.xdg.configHome}/mamba/config.yaml";
    MAMBA_ROOT_PREFIX = "${config.xdg.stateHome}/mamba";
    MANCOLOR = 1;
    MANPAGER = "nvim --clean +Man!";
    PAGER = "less";
    PIPX_HOME = "${config.xdg.stateHome}/pipx";
    POETRY_HOME = "${config.xdg.stateHome}/pypoetry";
    POETRY_VIRTUALENVS_PATH = "${config.xdg.stateHome}/pypoetry/envs";
    PYENV = "${config.xdg.stateHome}/pyenv/bin/pyenv";
    PYENV_ROOT = "${config.xdg.stateHome}/pyenv";
    PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/pycache";
    PYENV_VIRTUALENV_DISABLE_PROMPT = 1;
    PYSPARK_DRIVER_PYTHON = "ipython";
    RUSTUP_HOME = "${config.xdg.stateHome}/rustup";
    SCREENRC = "${config.xdg.configHome}/screen/screenrc";
    SPACEMACSDIR = "${config.xdg.configHome}/spacemacs";
    STACK_ROOT = "${config.xdg.stateHome}/stack";
    # home-manager handles plugins directly.
    # TMUX_PLUGIN_MANAGER_PATH = "${config.xdg.stateHome}/tmux/plugins/";
    VISUAL = "nvim";
    WEECHAT_HOME = "${config.xdg.configHome}/weechat";
    PATH = "${local_bin}:$PATH:${homebrew_prefix}/bin:${homebrew_prefix}/sbin:${config.xdg.stateHome}/cargo/bin:${config.xdg.stateHome}/go/bin";
  };

  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    mamba = "micromamba";
  };

  # Defaults to simply enable without much configuration.
  # More detailed configurations live in program specific .nix files.
  programs = {
    awscli.enable = true;
    bottom.enable = true;
    carapace.enable = true;
    dircolors.enable = true;
    # fish.enable = true;
    home-manager.enable = true;
    htop.enable = true;
    zoxide.enable = true;
  };

  xdg.enable = true;
  fonts.fontconfig.enable = true;
}
