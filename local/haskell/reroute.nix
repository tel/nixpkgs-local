# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, deepseq, graphCore, hashable, hspec2, mtl, pathPieces
, regexCompat, text, transformers, unorderedContainers, vector
}:

cabal.mkDerivation (self: {
  pname = "reroute";
  version = "0.2.1.0";
  sha256 = "1a74d58fwimm7gdq9ij4vzrk8wvklz769j9g50i9dpx3ymw3vwjg";
  buildDepends = [
    deepseq graphCore hashable mtl pathPieces regexCompat text
    transformers unorderedContainers vector
  ];
  testDepends = [
    deepseq graphCore hashable hspec2 mtl pathPieces regexCompat text
    transformers unorderedContainers vector
  ];
  meta = {
    homepage = "http://github.com/agrafix/reroute";
    description = "abstract implementation of typed and untyped web routing";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})