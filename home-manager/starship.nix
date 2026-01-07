{...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    enableIonIntegration = true;
    settings = {
      # Define all nerd-font symbols
      # Ported from the Nerd Font Symbols starship preset.
      cmd_duration = {
        show_milliseconds = true;
        style = "fg:bright-purple";
        format = "[ $duration]($style)";
        disabled = false;
        show_notifications = false;
        min_time_to_notify = 45000;
      };
      aws = {
        symbol = " ";
        style = "fg:bright-blue";
        format = "[$symbol$profile$region$duration ]($style)";
      };
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory = {
        read_only = " 󰌾";
        format = " [  $path ]($style)[$read_only]($read_only_style)";
        truncation_length = 4;
        truncation_symbol = "…/";
      };
      directory.substitutions = {
        Developer = "󰲋 ";
        Documents = "󰈙 ";
        Downloads = " ";
        Music = " ";
        Pictures = " ";
        ".config" = " ";
        ".git" = " ";
        src = "󰲋 ";
      };
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fossil_branch.symbol = " ";
      git_branch = {
        symbol = " ";
        style = "fg:purple";
        format = "[$symbol$branch(:$remote_branch) ]($style)";
      };
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = "⌘ ";
      hg_branch.symbol = " ";
      hostname = {
        format = "[󱫋 $ssh_symbol$hostname]($style)";
        trim_at = "";
        ssh_symbol = " ";
        ssh_only = false;
      };
      java.symbol = " ";
      julia.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      package = {
        symbol = "󰏗 ";
        format = "[$symbol$version ]($style)";
      };
      pijul_channel.symbol = " ";
      pixi.symbol = "󰏗 ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      spack.symbol = "🅢 ";
      zig.symbol = "  ";

      os.disabled = false;
      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Windows = "󰍲 ";
      };

      # Non-symbol settings.
      add_newline = true;
      directory.style = "blue bold";
      scan_timeout = 100;
      shell = {
        disabled = false;
        # style = "fg:bright-purple";
        # format = "[$indicator ]($style)";
      };
      time = {
        disabled = false;
        style = "fg:bright-cyan";
        format = "[ $time ]($style)";
      };
      username = {
        show_always = true;
        format = "[ $user ]($style)";
      };
      # python.scan_for_pyfiles = false;
    };
  };
}
