{ pkgs, ... }:
{  
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver  # VA-API NVDEC shim for Nvidia
        libva-utils          # vainfo to verify   
      ];
    };
    nvidia = {
      modesetting.enable = true;      # Required for Wayland compositors [9]
      powerManagement.enable = true;  # Enables suspend/resume units; maps to NVreg preserve setting [1][9]
      powerManagement.finegrained = false; # Optional; turn off dGPU when idle on newer GPUs [9]
      open = false;                   # Proprietary driver recommended for feature parity [4][9]
      nvidiaSettings = true;          # Optional: nvidia-settings tool [9]
      prime = {
        intelBusId = "PCI:2@0:2:0";
        nvidiaBusId = "PCI:1@0:0:0";
        sync.enable = true;
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };
      };
      # Optionally select driver line; latest or beta as needed:
      # package = config.boot.kernelPackages.nvidiaPackages.latest; [9]
    };
    thunderbolt.enable = true;
  };
  hardware.enableRedistributableFirmware = true;
}
