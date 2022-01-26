{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
, pkgs
}:

rustPlatform.buildRustPackage
rec {
  pname = "psst";
  version = "1627cd4a301dd51e9ee3034294cd7b0d94d02ddc";

  nativeBuildInputs = [ pkgs.pkg-config ];

  buildInputs = with pkgs; [
    alsa-lib
    dbus
    gtk3
  ];

  src = fetchFromGitHub {
    owner = "jpochyla";
    repo = pname;
    rev = "1627cd4a301dd51e9ee3034294cd7b0d94d02ddc";
    sha256 = "sha256-kepvYhmieXx6Hj79aqaA7tYUnueaBsNx0U4lV7K6LuU=";
  };

  cargoSha256 = "sha256-D1KNqCNKX8bsg8TGFrckLd/ZCzk6VG/3ObFPGgdnQ6c=";

  meta = with lib; {
    description = "Fast and multi-platform Spotify client with native GUI";
    homepage = "https://github.com/jpochyla/psst";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ ];
    mainProgram = "psst-gui";
  };
}
