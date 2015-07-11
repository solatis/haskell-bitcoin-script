{ mkDerivation, base, base16-bytestring, binary, bytestring, hspec
, stdenv, text
}:
mkDerivation {
  pname = "bitcoin-script";
  version = "0.11.1";
  src = ./.;
  buildDepends = [ base base16-bytestring binary bytestring text ];
  testDepends = [ base bytestring hspec ];
  homepage = "http://www.leonmergen.com/opensource.html";
  description = "Compilation, manipulation and decompilation of Bitcoin scripts";
  license = stdenv.lib.licenses.mit;
}
