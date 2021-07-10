{ pkgs ? import <nixpkgs> {}}:
let
  lua = import ./nix/lua.nix {inherit pkgs;};
in
pkgs.stdenv.mkDerivation rec {
  name = "nix.md";
  buildInputs = [] ++ lua;

  shellHook = ''
    PATH="$PATH:./bin"
  '';
}
