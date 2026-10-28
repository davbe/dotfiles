#!/bin/bash
# Install Omarchy customizations: symlink scripts into ~/.local/bin and add
# their Hyprland keybindings. Safe to re-run.

set -euo pipefail

dir="$(cd "$(dirname "$0")" && pwd)"
bindings=~/.config/hypr/bindings.lua

mkdir -p ~/.local/bin
for script in "$dir"/bin/*; do
  echo "Linking $(basename "$script") into ~/.local/bin"
  ln -sfn "$script" ~/.local/bin/"$(basename "$script")"
done

# The window switcher's menu (with Alt+letter hotkeys) is built from Omarchy's
# own menu, and rebuilt after every Omarchy update to keep up with it.
"$dir"/plugins/window-switcher/build
# A freshly built plugin isn't known to the running shell until it rescans.
omarchy-shell shell rescanPlugins
if ! jq -e 'any(.plugins[]?; .id == "daf.window-switcher")' ~/.config/omarchy/shell.json >/dev/null 2>&1; then
  omarchy-plugin-enable daf.window-switcher
fi
mkdir -p ~/.config/omarchy/hooks/post-update.d
ln -sfn "$dir"/plugins/window-switcher/rebuild.hook ~/.config/omarchy/hooks/post-update.d/rebuild-window-switcher.hook

if ! grep -q '"window-switcher"' "$bindings"; then
  echo "Adding SUPER+A window switcher binding to $bindings"
  cp "$bindings" "$bindings.bak.$(date +%s)"
  cat >> "$bindings" <<'LUA'

-- Searchable window switcher (jumps to the window's workspace)
o.bind("SUPER + A", "Window switcher", "window-switcher")
LUA
fi

hyprctl reload >/dev/null
hyprctl configerrors
