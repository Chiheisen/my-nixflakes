# Nix flakes

Some random programs that are not in nixpkgs (or in the process of being added).

## Usage

Flakes:

```nix
# flake.nix
inputs = {
    # ... your other inputs
    chiheisen.url = "git+https://git.sr.ht/~chiheisen/my-nix";
    chiheisen.inputs.nixpkgs.follows = "nixpkgs";
}
```

Adding packages:
```nix
# in environment.systemPackages, home.packages or similar
    inputs.chiheisen.packages."${system}".<pkg>;
```
