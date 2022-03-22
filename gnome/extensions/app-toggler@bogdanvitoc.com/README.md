This is a gnome extension that will allow you to toggle an app using a keyboard shortcut.

To install the extension:
1. Symlink folder into `~/.local/share/gnome-shell/extensions/`
2. Enable the extension: `gnome-extensions enable app-toggler@bogdanvitoc.com`
3. View logs: `journalctl -f -o cat /usr/bin/gnome-shell`

To add a new app:
1. Place the `wmclass` for the app in the Apps array in `extension.js`.
2. Configure a new keybinding for the app in `schemas/org.gnome.shell.extensions.app-toggler.gschema.xml`
3. Compile the schema: `glib-compile-schemas schemas/`
4. Restart x11/wayland

Documentation:
- GJS reference: https://gjs-docs.gnome.org
- Gnome extensions: https://gjs.guide/extensions/overview/architecture.html#clutter-and-st
- Keybindings: https://github.com/gTile/gTile/blob/14de1786818e56aa797229ebcece861360276134/app.ts
- Workspace stuff: https://github.com/satran/fullscreenworkspace-satran.in/blob/master/extension.js