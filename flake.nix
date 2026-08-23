{
  description = "Guaraguao, a keyboard layout for Romance languages";

  outputs = { self }: {
    # Drop this straight into your NixOS config's `imports`:
    #
    #   inputs.guaraguao.url = "github:rama-oi/guaraguao";
    #
    #   imports = [ inputs.guaraguao.nixosModules.default ];
    #
    # That's it — the layout is registered as "guaraguao" and ready to
    # reference from `services.xserver.xkb.layout` or a Sway/Hyprland
    # `xkb_layout` line.
    nixosModules.default = { lib, ... }: {
      services.xserver.xkb.extraLayouts.guaraguao = {
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
    };

    # Raw symbols file, for anyone who'd rather wire up extraLayouts
    # themselves instead of using the module above.
    symbolsFile = ./xkb/symbols/guaraguao;
  };
}
