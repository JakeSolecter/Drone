{ config, pkgs, ... }:
{
      nixpkgs.config.allowUnsupportedSystem = true;
    boot = {
        initrd.availableKernelModules = ["usbhid" "usb_storage"];
    };

      

    boot.kernelPackages = pkgs.linuxPackages_latest;


    boot.kernelModules = ["brcmfmac" "brcmutil" "cfg80211"];
    hardware.enableRedistributableFirmware = true;


    


  users = {
    users.pi = {
        isNormalUser = true;
        home = "/home/pi";
        description = "rootless pi access";
        extraGroups  = [ "wheel" "networkmanager" ];
        hashedPassword = "$6$GDj5Y7mIOZrPJ.jl$YuSC8z9d2D0DZEkCbsIuyGzbnNeSFT.iXSjlJLwpQ3dl2Q5ikcBIRQXp2vZol7Wfh6WUy4pHRPdI2wKu2S38b1";
    };

    users.root = {
        hashedPassword = "$6$WEGazopDCxObsDVk$Pxod6/2IsAOe7aNLPAAsHYSXV/BnKzsi8QAdugtW1b9mZd0TLB.8YkU5ZSYJBg1qOZmm69cO6d3dyLdaht4Or/";
    };
  };
  
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
        PasswordAuthentication = true;
        AllowUsers = null;
        PermitRootLogin = "yes";
    };
  };

  networking.wireless = {
    enable = true;
    interfaces = [ "wlan0" ];
    networks = {
      "Rasp" = {
        psk = "RaspTesting";
        priority = 5;
      };
    };
  };
  
  
  
  
  networking.hostName = "nixos-pi-zero2";
  


  

  system.stateVersion = "23.11"; 
}