{ lib, buildPythonPackage, fetchFromGitHub
, pytest, requests-mock, tox, ujson
, autobahn, certifi, chardet, cryptography, dateparser, pyopenssl, requests, service-identity, twisted }:

buildPythonPackage rec {
  version = "0.7.10";
  pname = "python-binance";

  src = fetchFromGitHub {
    owner = "sammchardy";
    repo = "python-binance";
    rev = "v${version}";
    sha256 = "sha256-m9LoVHMmOI7+9WgqDCpdj64SMYsJt/s40ro86sE6mTc=";
  };

  doCheck = false;  # Tries to test multiple interpreters with tox
  checkInputs = [ pytest requests-mock tox ];

  propagatedBuildInputs = [ ujson autobahn certifi chardet cryptography dateparser pyopenssl requests service-identity twisted ];

  meta = {
    description = "Binance Exchange API python implementation for automated trading";
    homepage = "https://github.com/sammchardy/python-binance";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.bhipple ];
  };
}
