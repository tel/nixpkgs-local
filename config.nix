{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    sass = rec {
      libSass = pkgs.callPackage ./local/etc/sass/libSass {};
      sassc   = pkgs.callPackage ./local/etc/sass/sassc {};
    };
    haskellPackages =
      pkgs.recurseIntoAttrs (pkgs.haskellPackages.override {
        extension = self : super :
        let callPackage = self.callPackage;
        in {
          fixed         = callPackage ./local/haskell/fixed.nix {};
          gl            = callPackage ./local/haskell/gl.nix {};
          graphCore     = callPackage ./local/haskell/graphCore.nix {};
          half          = callPackage ./local/haskell/half.nix {};
          hexpatLens    = callPackage ./local/haskell/hexpatLens.nix {};
          hexpatTagsoup = callPackage ./local/haskell/hexpatTagsoup.nix {};
          lattices      = callPackage ./local/haskell/lattices.nix {};
          lensAeson     = callPackage ./local/haskell/lensAeson.nix {};
          monadSt       = callPackage ./local/haskell/monadSt.nix {};
          mvc           = callPackage ./local/haskell/mvc.nix {};
          reroute       = callPackage ./local/haskell/reroute.nix {};
          spock         = callPackage ./local/haskell/spock.nix {};
          trace         = callPackage ./local/haskell/trace.nix {};
        };
      });
  };
}
