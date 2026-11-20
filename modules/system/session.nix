{ config, ... }:

let
  hostVariables = {
    atelier-01 = {
      LIBVA_DRIVER_NAME = "radeonsi";
      VDPAU_DRIVER = "radeonsi";
    };
    
    voyageur-02 = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
in

{
  environment.sessionVariables = {
    
    GDK_BACKEND = "wayland,x11";
    SDL_VIDEODRIVER = "wayland";
    
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    
    NIXOS_OZONE_WL = 1;
    
    PROTON_ENABLE_WAYLAND = 1;
    
  } // hostVariables.${config.networking.hostName};
}

