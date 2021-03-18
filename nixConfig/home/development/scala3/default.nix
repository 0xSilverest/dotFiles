{ stdenv, fetchurl, jre }:

stdenv.mkDerivation rec {
  name = "scala3";
  version = "3.0.0-RC1";

  src = fetchurl {
    urls = [
      "https://github.com/lampefl/dotty/releases/download/v${version}/scala3-${version}.tar.gz"
    ];
    sha256 = "91e9b4b5b0fc32a490f11a7dd64eea50711cbc06eb9aa01a21c5b156589c197c";
  };

   propagatedBuildInputs = [ jre ] ;
  buildInputs = [ makeWrapper ] ;

  installPhase = ''
    mkdir -p $out
    rm "bin/"*.bat
    mv * $out
    # put docs in correct subdirectory
    mkdir -p $out/share/doc
    mv $out/doc $out/share/doc/scala
    mv $out/{LICENSE,NOTICE} $out/share/doc/scala
    for p in $(ls $out/bin/) ; do
      wrapProgram $out/bin/$p \
        --prefix PATH ":" ${coreutils}/bin \
        --prefix PATH ":" ${gnugrep}/bin \
        --prefix PATH ":" ${jre}/bin \
        --set JAVA_HOME ${jre}
    done
  '';

  meta = {
    description = "General purpose programming language";
    longDescription = ''
      Scala is a general purpose programming language designed to express
      common programming patterns in a concise, elegant, and type-safe way.
      It smoothly integrates features of object-oriented and functional
      languages, enabling Java and other programmers to be more productive.
      Code sizes are typically reduced by a factor of two to three when
      compared to an equivalent Java application.
    '';
    homepage = "https://www.scala-lang.org/";
    license = stdenv.lib.licenses.bsd3;
    platforms = stdenv.lib.platforms.all;
  };
}

