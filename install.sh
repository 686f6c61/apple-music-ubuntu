#!/bin/bash
# Instala Apple Music como app en Ubuntu:
# script lanzador + entrada en el menú + icono + fijado al dock (opcional).
set -euo pipefail

cd "$(dirname "$0")"

BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"

mkdir -p "$BIN_DIR" "$APP_DIR" "$ICON_DIR"

install -m 755 apple-music.sh "$BIN_DIR/apple-music"
install -m 644 apple-music.desktop "$APP_DIR/apple-music.desktop"
install -m 644 apple-music.png "$ICON_DIR/apple-music.png"

update-desktop-database "$APP_DIR" 2>/dev/null || true

# Fijar al dock de Ubuntu si no está ya
if command -v gsettings >/dev/null; then
  favs=$(gsettings get org.gnome.shell favorite-apps)
  if [[ "$favs" != *apple-music.desktop* ]]; then
    gsettings set org.gnome.shell favorite-apps "${favs%]}, 'apple-music.desktop']"
    echo "Fijada al dock."
  fi
fi

echo "Instalada. Busca 'Apple Music' en el menú de aplicaciones o en la barra."
