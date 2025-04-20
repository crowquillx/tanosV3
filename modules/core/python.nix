{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: [ 
      ps.psutil
      (python3Packages.buildPythonPackage rec {
        pname = "ass";
        version = "0.5.2";
        src = python3Packages.fetchPypi {
          inherit pname version;
          sha256 = "7mMe3ohw2K6n0BmXf9luyTTOi8d5zFZO/By91g5GKxc=";
        };
        propagatedBuildInputs = with python3Packages; [ ];
      })
    ]))
  ];
}