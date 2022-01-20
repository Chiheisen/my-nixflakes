{ lib
, stdenv
, fetchurl
, python3
, fetchFromGitHub
, pkgs
}:

let pythonPackages = python3.pkgs;
in
pythonPackages.buildPythonApplication rec {
  pname = "minigalaxy";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "sharkwouter";
    repo = pname;
    rev = version;
    sha256 = "BbtwLuG5TH/+06Ez8+mwSAjG1IWg9/3uxzjmgPHczAw=";
  };

  doCheck = false;

  buildInputs = with pkgs; [ glib-networking gobjectIntrospection gtk3 ];
  nativeBuildInputs = with pkgs; [ gettext wrapGAppsHook ];
  propagatedBuildInputs = [ pkgs.docutils pythonPackages.pygobject3 pythonPackages.requests pkgs.webkitgtk ];

  meta = with lib; {
    homepage = "https://sharkwouter.github.io/minigalaxy/";
    downloadPage = "https://github.com/sharkwouter/minigalaxy/releases";
    description = "A simple GOG client for Linux";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
