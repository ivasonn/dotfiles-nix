self: super:
let inherit (super) callPackage; in
{
  i3lockpp = callPackage ./packages/i3lockpp { };
  xnview = callPackage ./packages/xnview { };
  powerline-rs = callPackage (import ./packages/powerline-rs).override {
    pkgs = super;
  };
  # powerline-rs = callPackage (import ./packages/powerline-rs).build {
  #   inherit (super.darwin.apple_sdk.frameworks) Security;
  #   openssl = super.openssl_1_1;
  # };

  awesome-freedesktop = callPackage ./packages/lua-packages/awesome-freedesktop.nix { };

}