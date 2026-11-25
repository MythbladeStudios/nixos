{ inputs, ... }: {

  imports = [ inputs.yeetmouse.nixosModules.default ];

  hardware.yeetmouse = {
    enable = true;
    sensitivity = 1.0;
    mode.motivity = {
      acceleration = 1.5;
      midpoint = 5.0;
    };
  };
}

