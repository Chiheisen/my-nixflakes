{ inputs, self }:

final: prev:
{
  gamescope = prev.callPackage ./gamescope { };
  minigalaxy = prev.callPackage ./minigalaxy { };
  psst = prev.callPackage ./psst { };
}
