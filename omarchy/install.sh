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
