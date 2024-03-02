{
  description = "Mark's NixOS Flake";
  inputs = {

  # Official NixOS package source, using nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
   # home-manager = { url = "github:nix-community/home-manager/release-unstable";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
    "who" = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [ ./configuration.nix ];
      };
    };
  };
}
