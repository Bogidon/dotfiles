// This file adapted from gTile
// https://github.com/gTile/gTile/blob/14de1786818e56aa797229ebcece861360276134/hotkeys.ts 

// Library imports
const Main = imports.ui.main;
const Meta = imports.gi.Meta;
const Shell = imports.gi.Shell;
const ExtensionUtils = imports.misc.extensionUtils;

// Extension imports
const Me = imports.misc.extensionUtils.getCurrentExtension();
const log = Me.imports.logging.log;

let mySettings = ExtensionUtils.getSettings("org.gnome.shell.extensions.app-toggler");


function bind(keyBindings) {
    log("Binding keys");

    keyBindings.forEach(({ key, callback }) => {
        if (Main.wm.addKeybinding && Shell.ActionMode) { // introduced in 3.16
            const args = [key,
                mySettings,
                Meta.KeyBindingFlags.NONE,
                Shell.ActionMode.NORMAL,
                callback];
            Main.wm.addKeybinding(...args);
        }
        else if (Main.wm.addKeybinding && Shell.KeyBindingMode) { // introduced in 3.7.5
            Main.wm.addKeybinding(
                key,
                mySettings,
                Meta.KeyBindingFlags.NONE,
                Shell.KeyBindingMode.NORMAL | Shell.KeyBindingMode.MESSAGE_TRAY,
                callback
            );
        }
        else {
            global.display.add_keybinding(
                key,
                mySettings,
                Meta.KeyBindingFlags.NONE,
                callback
            );
        }
    });
}

function unbind(keyBindings) {
    log("Unbinding keys");
    keyBindings.forEach(({ key }) => {
        if (Main.wm.removeKeybinding) { // introduced in 3.7.2
            Main.wm.removeKeybinding(key);
        }
        else {
            global.display.remove_keybinding(key);
        }
    })
}