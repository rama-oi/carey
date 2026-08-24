{
  description = "carey, a keyboard layout for Romance languages";

  outputs = { self }: {
    # Drop this straight into your NixOS config's `imports`:
    #
    #   inputs.carey.url = "github:rama-oi/carey";
    #
    #   imports = [ inputs.carey.nixosModules.default ];
    #
    # That's it — the layout is registered as "carey" and ready to
    # reference from `services.xserver.xkb.layout` or a Sway/Hyprland
    # `xkb_layout` line.
    nixosModules.default = { lib, ... }: {
      services.xserver.xkb.extraLayouts.carey = {
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
    };

    # Raw symbols file, for anyone who'd rather wire up extraLayouts
    # themselves instead of using the module above.
    symbolsFile = ./xkb/symbols/carey;
  };
}
