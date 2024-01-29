{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs @ {
    flake-parts,
    ...
  }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
    perSystem = { pkgs, system, ... }: let
      buildInputs = with pkgs; [ jdk17 jdt-language-server ];
    in {
      devShells.default = pkgs.mkShell {
        inherit buildInputs;
      };
    };
  };
}
