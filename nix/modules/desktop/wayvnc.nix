{ config, pkgs, ... }:

{
  # Configure wayvnc to start automatically under systemd
  systemd.user.services.wayvnc = {
    Unit = {
      Description = "wayvnc Remote Desktop Server";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      # Listen on all interfaces (including Tailscale) on default VNC port 5900.
      # It will automatically pick up the config file in ~/.config/wayvnc/config.
      ExecStart = "${pkgs.wayvnc}/bin/wayvnc -r 0.0.0.0 5900";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
