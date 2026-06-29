{ config, pkgs, lib, ... }:

{
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

  home.packages = with pkgs; [
    # [System Utils & CLI Tools]
    wget
    curl
    gum
    jq
    btop
    ripgrep
    fd
    unzip
    rsync
    inotify-tools
    xclip
    wl-clipboard
    jq
    eza
    bat
    fastfetch
    figlet
    htop
    fzf
    libnotify
    
    # [Ported Utils]
    lazygit
    lolcat
    lsb-release
    xsel
    ncdu
    duf
    tldr
    yq-go
    fnm

    # [LSP & Neovim Tools]
    tree-sitter
    nil
    ast-grep
    lua51Packages.jsregexp
    gopls
    clang-tools
    yaml-language-server
    bash-language-server
    dockerfile-language-server-nodejs

    # [Hyprland Utilities]
    hyprpaper
    hyprpicker
    brightnessctl
    pamixer
    grim
    slurp
    swappy
    cliphist
    udiskie
    swaybg
    imagemagick
    quickshell
    grimblast
    wayvnc

    # [GUI & Desktop Components]
    waybar
    rofi
    wlogout
    waypaper
    nwg-look
    nwg-dock-hyprland
    qt6Packages.qt6ct
    qt6Packages.qt5compat
    pavucontrol
    blueman
    networkmanagerapplet
    swaynotificationcenter
    matugen

    # [Themes & Cursors]
    ayu-theme-gtk
    papirus-icon-theme
    bibata-cursors

    # [Fonts]
    maple-mono.NF
    nerd-fonts.ubuntu-mono
    nerd-fonts.jetbrains-mono
    monaspace
  ];
}
