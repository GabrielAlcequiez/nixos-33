{ config, lib, pkgs, ... }:

{
  system.stateVersion = "25.11";

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Systemd-boot with XBOOTLDR
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/efi";
  boot.loader.systemd-boot.xbootldrMountPoint = "/boot";  

  # Network and hostname
  networking.hostName = "nixos33";
  networking.networkmanager.enable = true;

  # Time Zone
  time.timeZone = "America/Santo_Domingo";
  

  # prueba
  boot.kernelParams = [ 
    "hid_apple.fnmode=2"
    "nvidia.NVreg_DynamicPowerManagement=0x02" 
  ];
  
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

   # Windowing system
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
  
  # To use Wayland (Experimental for SDDM)
    wayland.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  services.gnome.gcr-ssh-agent.enable = false;

  # AUTO-CPUFREQ (To better control with temps)
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = false;

  services.tlp = {
    enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_BOOST_ON_AC = 0;
        CPU_BOOST_ON_BAT = 0;

        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        START_CHARGE_THRESH_BAT0 = 0; 
        STOP_CHARGE_THRESH_BAT0 = 1; # 1 activa el modo conservación

        RUNTIME_PM_ON_AC = "on";
        RUNTIME_PM_ON_BAT = "auto";

      };

    }; 
 
  services.upower.enable = true; 
  # NVIDIA Drivers and Config
  services.xserver.videoDrivers = [ "nvidia" "amdgpu"];
  hardware = {
    graphics.enable = true;

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.production;
      open = true;
      dynamicBoost.enable = true;
      nvidiaPersistenced = false;
      modesetting.enable = true;

      powerManagement = {
	      enable = true;
  	    finegrained = true;
      };
      
      prime = {
        offload = {
	      enable = true;
	      enableOffloadCmd = true;
        };

        nvidiaBusId = "PCI:1:0:0";
        amdgpuBusId = "PCI:5:0:0";
      };
    };
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

   extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
      };
    }; 
  };

  # Bluetooth 
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  programs.zsh.enable = true;

  # User account
  users.users.gxbbab = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh; 
    packages = with pkgs; [
      tree
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Niri installation
  programs.niri.enable = true;
  programs.firefox.enable = true;
  programs.ssh.startAgent = true;
  # Packages installed in system profile
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  environment.systemPackages = with pkgs; [
    vim
    kitty
    fuzzel
    wget
    git
    fastfetch
    spotify
    vscode
    btop
    pfetch
    haruna
    bottom
    obsidian
    bat
    libreoffice-fresh
    vesktop
    vencord
    teams-for-linux
    obs-studio
  ];

}

