{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name    = "libsass";
  version = "3.0.2";
  src     = fetchFromGitHub {
    owner  = "sass";
    repo   = "libsass";
    rev    = "${version}";
    sha256 = "04kh6lsdv497hf6hfx0zzmsdffl6hss33xn7dn3yia891g8a371m";
  };

  patchPhase   = "sed '19,23d' $src/Makefile > Makefile";
  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/include
    mv lib/libsass.a $out/lib
    mv *.h           $out/include
  '';
  
  meta = with stdenv.lib; {
    homepage = "http://libsass.org/";
    description = "A SASS compiler in C/C++";
    license = stdenv.lib.licenses.mit;
    platforms = stdenv.lib.platforms.unix;
#    maintainers = with maintainers; [ tel ];
  };
}       
