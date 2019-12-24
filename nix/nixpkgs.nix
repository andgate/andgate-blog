{ sources ? import ./sources.nix }:

let
  # compilerVersion = "ghc865";

  overlay = _: nixpkgs: {
    haskell = nixpkgs.haskell // {
      packages = nixpkgs.haskell.packages // {
        ghc865 = nixpkgs.haskell.packages.ghc865.extend (self: super: {
          andgate-blog = self.callCabal2nix "andgate-blog" ../. {};
          niv = (import sources.niv {}).niv;
        });
      };
    };
  };

in import sources.nixpkgs { overlays = [ overlay ]; }
