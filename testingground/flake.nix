{
  description = "Rust flake";
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
    };
  
  outputs = { self, nixpkgs, ... }@inputs:
    let
     system = "x86_64-linux"; 
     pkgs = nixpkgs.legacyPackages.${system};    
    in
    {
      devShells.${system}.default = pkgs.mkShell
      {
        stdenv = pkgs.clangStdenv;

        packages = with pkgs; [ 
          pkg-config

          rustc 
          rustup
          clang
          wayland
          cargo 
          rustPlatform.bindgenHook
          glfw
          libGL
          libxkbcommon
          xorg.libX11
          xorg.libXcursor
          xorg.libXrandr
          xorg.libXi
          xorg.libXinerama
          xorg.libXxf86vm
          vulkan-tools

          cmake
        ];       


        nativeBuildInputs = [
          pkgs.libGL

        ];

        LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
          libGL
          xorg.libXrandr
          xorg.libXinerama
          xorg.libXcursor
          xorg.libXi
          xorg.libX11
          xorg.libXxf86vm
        ];
        LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";

      };
    };
}