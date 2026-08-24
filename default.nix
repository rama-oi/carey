# For non-flake setups (channels). Usage in configuration.nix:
#
#   services.xserver.xkb.extraLayouts =
#     (import (fetchTarball
#       "https://github.com/rama-oi/carey/archive/refs/heads/master.tar.gz"
#     )).extraLayouts;
#
{
  extraLayouts.carey = {
    description = "carey";
    languages = [
      "spa"
      "fra"
      "por"
      "ita"
      "ron"
      "cat"
      "glg"
      "oci"
      "srd"
      "lld"
      "roh"
      "ast"
      "arg"
      "cos"
      "wln"
      "mwl"
      "rup"
    ];
    symbolsFile = ./xkb/symbols/carey;
  };
}
