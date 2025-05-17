{pkgs, ...}: {
  # Only enable either docker or podman -- Not both
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
    podman.enable = false; 
    podman.dockerCompat = false;
    podman.defaultNetwork.settings.dns_enabled = false;
  };
  programs = {
    virt-manager.enable = true;
  };
  environment.systemPackages = with pkgs; [
    virt-viewer # View Virtual Machines
    qemu
  ];
}
