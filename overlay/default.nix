self: super:
let inherit (super) callPackage; in
{
  flat-remix = callPackage ./packages/flat-remix { };
  i3lockpp = callPackage ./packages/i3lockpp { };
  adhosts = callPackage ./packages/adhosts { };

  kind = callPackage ./packages/kind { };
  ferret = callPackage ./packages/ferret { };
  babashka = callPackage ./packages/bb { };

  my-emacs = callPackage ./packages/emacs { };

  arion = callPackage "${super.fetchFromGitHub {
    owner = "hercules-ci";
    repo = "arion";
    rev = "221bccd7f149a25fefce8943179ef62cb73d4313";
    sha256 = "0i02bwbyy0m382avvvkj49rhq1i2vqjgxcnvzrj345pbwqvh3xq3";
  }}/arion.nix" { };

  vivaldi = super.vivaldi.override { proprietaryCodecs = true; };

  lm-sensors = callPackage ./packages/lm-sensors { };

  powerline-rs = callPackage (import ./packages/powerline-rs).override {
    pkgs = super;
  };
  # powerline-rs = callPackage (import ./packages/powerline-rs).build {
  #   inherit (super.darwin.apple_sdk.frameworks) Security;
  #   openssl = super.openssl_1_1;
  # };

  # parinfer-rust = callPackage ./packages/parinfer-rust { };

  awesome-freedesktop = callPackage ./packages/lua-packages/awesome-freedesktop.nix { };

  fennel = callPackage ./packages/fennel { };

  bandcamp-downloader = callPackage ./packages/bandcamp-downloader { pythonPackages = self.python36Packages; };
  scdl = callPackage ./packages/scdl { pythonPackages = self.python37Packages; };
  fabric1 = callPackage ./packages/fabric1 { pythonPackages = self.python27Packages; };

  xnview = callPackage ./packages/xnview { };

  # bzip2 = callPackage ./packages/xnview/bzip2.nix { };

  xi-editor = callPackage ({ rustPlatform, fetchFromGitHub }:
    rustPlatform.buildRustPackage rec {
      name = "xi-editor";
      src = "${fetchFromGitHub {
        owner = "xi-editor";
        repo = name;
        rev = "add9e3e2f74c1324e85d1e2208f361b435b3fe2f";
        sha256 = "1wy84a7q0gmchdklg50z3jzfbriwsd4awgqngmkq9szxxs35rhz4";
      }}/rust";
      cargoSha256 = "1bcmr6ndzj5j0jqbmi61x3dim1x5cj7rgy7r92fr8c4x9hp986wx";
  }) { };

}
