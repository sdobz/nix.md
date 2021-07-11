{ pkgs ? import <nixpkgs> {}}:
let
  lua = import ./nix/lua.nix { inherit pkgs; };
  patterns = ''
    /*
    !/Makefile
    !/tlconfig.lua
    !/src
    !/bin
  '';
in
pkgs.stdenv.mkDerivation {
  name = "nix.md";
  buildInputs = [] ++ lua;

  src = pkgs.nix-gitignore.gitignoreSourcePure patterns ./.;

  buildPhase = ''
    make clean && make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp bin/nixmd $out/bin
    cp -r build $out
  '';

  shellHook = ''
    PATH="$PATH:./bin"
  '';
}
