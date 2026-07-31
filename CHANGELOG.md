# Changelog

## [1.0.1] - 2026-07-31

### Corregido
- `StartupWMClass` apuntaba a `AppleMusic` (valor de `--class`, que Chrome ignora en Wayland); el app_id real es `chrome-music.apple.com__-Default`. Ahora GNOME agrupa la ventana con el icono del dock y al pulsar el icono se enfoca la ventana abierta en vez de lanzar una nueva.

## [1.0.0] - 2026-07-31

### Añadido
- Lanzador de Apple Music como app: Chrome en modo `--app` con perfil dedicado (`~/.config/apple-music-chrome`) que conserva la sesión del Apple ID.
- Comprobación de actualizaciones de Chrome al arrancar, con diálogo de confirmación y actualización vía `apt` + `pkexec`.
- Entrada en el menú de aplicaciones (`apple-music.desktop`) e icono oficial de Apple Music.
- App fijada a la barra (favoritos del dock de Ubuntu).

### Corregido
- Ruta con espacios en el `Exec` del `.desktop` que impedía a GNOME registrar la aplicación; el script vive ahora en `~/.local/bin/apple-music`.
