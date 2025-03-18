{
  description = "Niximage-builder flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; 
    nixos-generators.url = "github:nix-community/nixos-generators"; 

  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {

        packages = with pkgs;[
          nixos-generators
          whois
          util-linux
        ];

       
        

      };
    };
    
  
}
