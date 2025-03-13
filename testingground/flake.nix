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
          libclang
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
          xorg.xkeyboardconfig
          vulkan-tools
          wayland
          libxkbcommon
          vulkan-loader
          wayland-protocols
          wayland-utils
          libglvnd
          mesa
          cmake
          glfw-wayland
        ];   

        buildInputs = with pkgs; [
          xorg.libXext
          xorg.libXfixes
          binutils-unwrapped
          alsa-lib
          openssl
          glib
          clang
          vulkan-headers
          vulkan-validation-layers
          wayland
          libclang
          wayland-protocols
          wayland-scanner
          libxkbcommon
          vulkan-loader
          vulkan-tools
          xorg.libX11
          xorg.libXcursor
          xorg.libXrandr
          xorg.libXi
          xorg.libXinerama
          xorg.libXxf86vm
          xorg.xf86videoamdgpu
          libglvnd
          mesa
          xorg.xkeyboardconfig
          rocmPackages.rocm-runtime
          libva
          libdrm
          udev
          rocmPackages.rocm-core
          rocmPackages.hipcc
          mesa
          amdvlk

        ];

        


        nativeBuildInputs = [
          pkgs.libGL
          pkgs.pkg-config
          pkgs.cargo
          pkgs.rustc
          pkgs.vulkan-tools
          pkgs.clinfo

        ];

        LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
          libGL
          xorg.libXrandr
          xorg.libXinerama
          xorg.libXcursor
          xorg.libXi
          xorg.libX11
          xorg.libXxf86vm
          wayland-protocols
          wayland-utils
          wayland
          libglvnd
          libxkbcommon
          vulkan-loader
          mesa
          rocmPackages.rocm-runtime
          xorg.libXext
          xorg.libXfixes

        ];
        LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";

      };
    };
}