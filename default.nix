# For non-flake setups (channels). Usage in configuration.nix:
#
#   services.xserver.xkb.extraLayouts =
#     (import (fetchTarball
#       "https://github.com/rama-oi/guaraguao/archive/refs/heads/master.tar.gz"
#     )).extraLayouts;
#
{
  extraLayouts.guaraguao = {
    description = "Guaraguao";
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
    symbolsFile = ./xkb/symbols/guaraguao;
  };
}
