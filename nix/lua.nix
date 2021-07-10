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

  luaDeps = with pkgs.luaPackages; [ tl ];
in
  luaDeps