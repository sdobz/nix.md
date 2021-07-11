{pkgs}:

let
  argparse = pkgs.luaPackages.buildLuarocksPackage (with pkgs; with luaPackages; rec {
    pname = "argparse";
    version = "0.7.1-1";

    src = fetchurl {
      url    = "https://luarocks.org/${pname}-${version}.src.rock";
      sha256 = "0ybqh5jcb9v8f5xpq05av4hzrbk3vfvqrjj9cgmhm8l66mjd0c7a";
    };
    disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
    propagatedBuildInputs = [ lua ];

    meta = with lib; {
      homepage = "https://github.com/mpeterv/argparse";
      description = "A feature-rich command-line argument parser";
      license = {
        fullName = "MIT";
      };
    };
  });
  tl = pkgs.luaPackages.buildLuarocksPackage (with pkgs; with pkgs.luaPackages; rec {
    pname = "tl";
    version = "0.13.1-1";

    src = fetchurl {
      url    = "https://luarocks.org/${pname}-${version}.src.rock";
      sha256 = "06ybm6blazbglhxxmgxhx505gl0whjn3dqlazyfm8iagppbqbga9";
    };
    disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
    propagatedBuildInputs = [ lua compat53 argparse luafilesystem ];

    meta = with lib; {
      homepage = "https://github.com/teal-language/tl";
      description = "The compiler for Teal, a typed dialect of Lua";
      maintainers = with maintainers; [ hishamhm ];
      license.fullName = "MIT";
    };
  });

  cosmo = pkgs.luaPackages.buildLuarocksPackage (with pkgs; with pkgs.luaPackages; rec {
    pname = "cosmo";
    version = "16.06.04-1";

    src = fetchurl {
      url    = "https://luarocks.org/${pname}-${version}.src.rock";
      sha256 = "1adrk74j0x1yzhy0xz9k80hphxdjvm09kpwpbx00sk3kic6db0ww";
    };
    disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
    propagatedBuildInputs = [ lpeg ];

    meta = with lib; {
      homepage = "https://github.com/mascarenhas/cosmo";
      description = "Lua library for conversion between markup formats ";
      maintainers = with maintainers; [ mascarenhas ];
      license.fullName = "MIT/X11";
    };
  });
  lunamark = pkgs.luaPackages.buildLuarocksPackage (with pkgs; with pkgs.luaPackages; rec {
    pname = "lunamark";
    version = "0.5.0-1";

    knownRockspec = (fetchurl {
      url    = "https://luarocks.org/${pname}-${version}.rockspec";
      sha256 = "0wrhs1qzw2jpc251akiv5vhxmz026jcs7s0p43x7lp41nmj1xx2p";
    }).outPath;

    src = fetchurl {
      url    = "https://github.com/jgm/lunamark/archive/refs/tags/0.5.0.tar.gz";
      sha256 = "05kpv3vp12kzsdwa0x6l3a35igyfk1b2pa6iv94c64c6m075jrva";
    };
    disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
    propagatedBuildInputs = [ lua alt-getopt cosmo lpeg luautf8 ];

    meta = with lib; {
      homepage = "https://github.com/jgm/lunamark";
      description = "Lua library for conversion between markup formats ";
      maintainers = with maintainers; [ jgm ];
      license.fullName = "MIT/X11";
    };
  });

  luaDeps = with pkgs.luaPackages; [ tl lunamark ];
in
  luaDeps