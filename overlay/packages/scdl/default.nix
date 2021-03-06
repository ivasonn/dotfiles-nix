{ pythonPackages }:

with pythonPackages;
buildPythonApplication rec {
  pname = "scdl";
  version = "1.6.12";

  patches = [ ./home.patch ];

  src = fetchGit {
    url = "https://github.com/flyingrub/scdl.git";
    rev = "b0a164f843d7d7282f4f2e742892e0239d282a91";
  };

  propagatedBuildInputs = [
    mutagen
    requests
    clint
    termcolor
    docopt
  ];

}
