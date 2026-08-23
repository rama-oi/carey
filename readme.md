# Guaraguao

**Guaraguao** is a **keyboard layout for Romance languages**. It extends the standard English keyboard with **dead keys and accents**, enabling efficient typing in a wide range of Romance languages while also providing a rich set of **math, logic, and special symbols**.

---

## Dead Keys Included

guaraguao includes the following **dead keys**, used to type accented and diacritic characters:

```
´ ¨ ^ ˇ ˘ ¯ ° ~ ¸ ˛
```

These allow typing characters such as:

```
á, à, â, ă, ä, é, è, ê, ë, í, ì, î, ï, ó, ò, ô, ö, ú, ù, û, ü, ñ, ș, ț, ç
```

…and many others across all supported Romance languages.

---

## Installation (NixOS)

Guaraguao is distributed as a plain XKB symbols file plus a NixOS module. There's no package to build or install manually, you register it declaratively via [`services.xserver.xkb.extraLayouts`](https://search.nixos.org/options?query=services.xserver.xkb.extraLayouts), which works for X11 sessions and for Wayland compositors that read the system XKB database (Sway, Hyprland, etc. Sway just needs its own `xkb_layout` line pointed at it, see below).

### With flakes

```nix
{
  inputs.guaraguao.url = "github:rama-oi/guaraguao";

  outputs = { nixpkgs, guaraguao, ... }: {
    nixosConfigurations.yourhost = nixpkgs.lib.nixosSystem {
      modules = [
        guaraguao.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
```

That registers the layout under the name `guaraguao`. Nothing else in your config needs to change unless you want it active somewhere specific. see below.

### Without flakes

```nix
services.xserver.xkb.extraLayouts =
  (import (fetchTarball
    "https://github.com/rama-oi/guaraguao/archive/refs/heads/master.tar.gz"
  )).extraLayouts;
```

### Using the layout

For a plain X11 session:

```nix
services.xserver.xkb.layout = "us,guaraguao";
```

For **Sway** (or another Wayland compositor that doesn't read `services.xserver.xkb.layout` on its own), set it directly in the compositor config:

```
input "type:keyboard" {
    xkb_layout "us,guaraguao"
    xkb_options "grp:win_space_toggle"
}
```

Adjust `xkb_options` to whatever toggle key combo you prefer, or drop `us,` if you want guaraguao as your only layout.

---

## Guaraguao Keyboard Layout

| Key | Default | Shift | AltGr           | Shift+AltGr |   |
| --- | ------- | ----- | --------------- | ----------- | - |
| `   | `       | ~     | dead_grave      | null        |   |
| 1   | 1       | !     | dead_acute      | null        |   |
| 2   | 2       | @     | dead_diaeresis  | null        |   |
| 3   | 3       | #     | dead_circumflex | null        |   |
| 4   | 4       | $     | dead_caron      | null        |   |
| 5   | 5       | %     | dead_breve      | null        |   |
| 6   | 6       | ^     | dead_macron     | null        |   |
| 7   | 7       | &     | dead_abovering  | ·           |   |
| 8   | 8       | *     | dead_tilde      | null        |   |
| 9   | 9       | (     | dead_cedilla    | null        |   |
| 0   | 0       | )     | dead_ogonek     | null        |   |
| -   | -       | _     | ×               | ÷           |   |
| =   | =       | +     | ≠               | ≡           |   |
| Q   | q       | Q     | ∈               | ∉           |   |
| W   | w       | W     | ↑               | ⇑           |   |
| E   | e       | E     | €               | null        |   |
| R   | r       | R     | ®               | null        |   |
| T   | t       | T     | ™               | null        |   |
| Y   | y       | Y     | ¥               | null        |   |
| U   | u       | U     | ∪               | ∩           |   |
| I   | i       | I     | ∞               | null        |   |
| O   | o       | O     | ∅               | null        |   |
| P   | p       | P     | ¶               | null        |   |
| [   | [       | {     | ¡               | null        |   |
| ]   | ]       | }     | !               | null        |   |
| A   | a       | A     | ←               | ⇐           |   |
| S   | s       | S     | ↓               | ⇓           |   |
| D   | d       | D     | →               | ⇒           |   |
| F   | f       | F     | ƒ               | ∫           |   |
| G   | g       | G     | °               | null        |   |
| H   | h       | H     | ±               | null        |   |
| J   | j       | J     | ∧               | ∨           |   |
| K   | k       | K     | §               | null        |   |
| L   | l       | L     | £               | λ           |   |
| ;   | ;       | :     | ¿               | null        |   |
| '   | '       | "     | ?               | null        |   |
| \   | \       | bar   | null            | null        |   |
| Z   | z       | Z     | <               | «           |   |
| X   | x       | X     | >               | »           |   |
| C   | c       | C     | ©               | ¢           |   |
| V   | v       | V     | ∇               | null        |   |
| B   | b       | B     | Ƀ               | null        |   |
| N   | n       | N     | dead_tilde      | ¬           |   |
| M   | m       | M     | µ               | null        |   |
| ,   | ,       | <     | «               | ≤           |   |
| .   | .       | >     | »               | ≥           |   |
| /   | /       | ?     | \               | ¿           |   |

---

## Layout Information

* **Name:** `guaraguao`
* **Short Description:** `rom`
* **Supported Languages:** See the detailed list above
* **Dead Keys:** `´ ¨ ^ ˇ ˘ ¯ ° ~ ¸ ˛`

---

## Notes

* Guaraguao is just the XKB `symbols/guaraguao` file plus a Nix module. no binaries, no post-install scripting, nothing that touches system files outside of what Nix builds declaratively.
* License: GPL-3.0, see `license.md`.
