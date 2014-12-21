{ stdenv, fetchFromGitHub, sass }:

stdenv.mkDerivation rec {
  name    = "sassc";
  version = "3.0.2";
  src     = fetchFromGitHub {
    owner  = "sass";
    repo   = "sassc";
    rev    = "${version}";
    sha256 = "0h909jkf3w4k3vhnblqwqkxhg7p3l12mjhp339g7jgdb65qh7ssh";
  };

  patchPhase = ''
    sed '15,20d' $src/Makefile > Makefile
  '';

  buildPhase = ''
    cc -c -Wall -O2 -I ${sass.libSass}/include  sassc.c -o sassc.o
    cc -O2 -o bin/sassc sassc.o ${sass.libSass}/lib/libsass.a -lstdc++ -lm
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv bin/sassc $out/bin
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/sass/sassc";
    description = "libsass command line driver";
    license = stdenv.lib.licenses.mit;
    platforms = stdenv.lib.platforms.unix;
#    maintainers = with maintainers; [ tel ];
  };
}       
