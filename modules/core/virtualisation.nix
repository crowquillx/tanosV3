{pkgs, ...}: {
  # Only enable either docker or podman -- Not both
  virtualisation = {
    libvirtd.enable = false;
    docker.enable = false;
    podman.enable = true; 
    podman.dockerCompat = true;
    podman.defaultNetwork.settings.dns_enabled = true;
  };
  programs = {
    virt-manager.enable = false;
  };
  environment.systemPackages = with pkgs; [
    # virt-viewer # View Virtual Machines
    distrobox
  ];
}
