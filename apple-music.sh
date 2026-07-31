#!/bin/bash
# Lanza Apple Music como app independiente con Chrome.
# El perfil dedicado en ~/.config/apple-music-chrome conserva el login
# (cookies y contraseña guardada) y no se mezcla con tu Chrome normal.

PKG="google-chrome-stable"

# --- Comprobación de actualizaciones de Chrome ---
# Si hay una versión nueva en apt, pregunta y actualiza antes de abrir.
if apt list --upgradable 2>/dev/null | grep -q "^$PKG/"; then
  if zenity --question \
      --title="Apple Music" \
      --width=420 \
      --text="Hay una actualización de Google Chrome disponible.\n¿Quieres actualizarlo ahora?" \
      --ok-label="Actualizar" \
      --cancel-label="Más tarde"; then
    if pkexec apt-get install --only-upgrade -y "$PKG"; then
      zenity --info --title="Apple Music" --width=350 \
        --text="Chrome se ha actualizado correctamente."
    else
      zenity --error --title="Apple Music" --width=350 \
        --text="No se pudo actualizar Chrome.\nSe abrirá con la versión actual."
    fi
  fi
fi

exec google-chrome \
  --user-data-dir="$HOME/.config/apple-music-chrome" \
  --app=https://music.apple.com \
  --no-first-run \
  --disable-session-crashed-bubble \
  --class=AppleMusic \
  "$@"
