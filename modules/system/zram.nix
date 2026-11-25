{ config, ... }:

let
  memoryPerHost = {
    atelier-01 = 25; # 25% of 32GB = 8GB
    voyageur-02 = 20; # 20% of 40GB = 8GB
  };
in

{
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = memoryPerHost.${config.networking.hostName};
  };
}

