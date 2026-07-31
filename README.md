# Apple Music para Ubuntu

Apple Music como aplicación de escritorio en Ubuntu, usando Google Chrome en modo app con un perfil dedicado.

## Cómo funciona

- `apple-music.sh` lanza Chrome con `--app=https://music.apple.com` (ventana sin barras ni pestañas, como una app nativa).
- Usa un perfil separado en `~/.config/apple-music-chrome`, así que:
  - el login de tu Apple ID se conserva entre sesiones,
  - no se mezcla con tu Chrome normal,
  - Chrome incluye Widevine DRM, necesario para la reproducción.
- Al arrancar comprueba si hay actualizaciones de Chrome en `apt` y ofrece actualizar antes de abrir.

## Instalación

Con el instalador (copia el script a `~/.local/bin`, registra el lanzador, instala el icono y la fija al dock):

```bash
git clone https://github.com/686f6c61/apple-music-ubuntu.git
cd apple-music-ubuntu
./install.sh
```

La instalación real vive fuera de este repositorio (rutas del sistema de cada usuario):

| Pieza | Ubicación |
|---|---|
| Script lanzador | `~/.local/bin/apple-music` |
| Lanzador de aplicaciones | `~/.local/share/applications/apple-music.desktop` |
| Icono | `~/.local/share/icons/apple-music.png` |
| Perfil de Chrome (sesión, cookies) | `~/.config/apple-music-chrome` |

Instalación manual equivalente:

```bash
cp apple-music.sh ~/.local/bin/apple-music && chmod +x ~/.local/bin/apple-music
cp apple-music.desktop ~/.local/share/applications/
cp apple-music.png ~/.local/share/icons/
update-desktop-database ~/.local/share/applications
```

## Actualizaciones de Chrome

Al abrir la app, si `apt` detecta una versión nueva de `google-chrome-stable` aparece un diálogo para actualizar (usa `pkexec`, pide tu contraseña de sudo). La sesión guardada no se pierde con las actualizaciones.

## Desinstalación

```bash
rm ~/.local/bin/apple-music
rm ~/.local/share/applications/apple-music.desktop
rm ~/.local/share/icons/apple-music.png
rm -rf ~/.config/apple-music-chrome   # borra la sesión guardada
```
