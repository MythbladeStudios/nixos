{ inputs, ... }: {

  imports = [ inputs.disko.nixosModules.disko ];

  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "btrfs";
                extraArgs = ["-f"];
                mountpoint = "/";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                  "space_cache=v2"
                  "discard=async"
                ];
              };
            };
          };
        };
      };
    };
  };
}

