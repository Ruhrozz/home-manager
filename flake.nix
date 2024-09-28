{
  description = "Home Manager configuration of ruhrozz";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      userConfig = username:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nixvim.homeManagerModules.nixvim
            {
              home.username = username;
              home.homeDirectory = "/home/${username}";
            }
            ./home.nix
          ];
        };
    in {
      homeConfigurations = {
        ruhrozz = userConfig "ruhrozz";
        malofeev = userConfig "malofeev"; # malofeev == ruhrozz
      };
    };
}
