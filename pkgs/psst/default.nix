{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
, pkgs
}:

rustPlatform.buildRustPackage rec {
  pname = "psst";
  version = "0.0.1";

  nativeBuildInputs = [ pkgs.pkg-config ];

  buildInputs = with pkgs; [
    alsa-lib
    dbus
    gtk3
  ];

  src = fetchFromGitHub {
    owner = "jpochyla";
    repo = pname;
    rev = "4de5ad1";
    sha256 = "sha256-UqugggZmAlvJ+ty+261eHUkl2IPNbLaTYBY1pOrY8DI=";
  };

  cargoSha256 = "sha256-BORftZOpn8O05bIrWpak2Bz99Kast/6io1dD2ZlMVx0=";

  meta = with lib; {
    description = "Fast and multi-platform Spotify client with native GUI";
    homepage = "https://github.com/jpochyla/psst";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ ];
    mainProgram = "psst-gui";
  };
}
