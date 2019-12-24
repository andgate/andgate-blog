let
  compilerVersion = "ghc865";
  pkgs = import ./nix/nixpkgs.nix {};
in
pkgs.haskell.packages.${compilerVersion}.shellFor {
  withHoogle = true;
  packages = self: [ self.andgate-blog ];
  buildInputs = with pkgs; [
    (haskell.packages.${compilerVersion}.ghcWithPackages (p: [
      p.cabal-install
      p.hlint
      p.stylish-cabal
      p.stylish-haskell
      p.pointfree
      p.pointful
      p.niv
      p.hakyll
    ]))

  ];
}
