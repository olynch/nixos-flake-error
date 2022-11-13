{
  description = "An mwe for bug";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
      {
        nixosConfigurations.test = nixpkgs.lib.nixosSystem {
          inherit system;
          modules =
            [
              ({pkgs,...}: {
                nixpkgs.pkgs = pkgs;
              })
            ];
        };
      };
}
