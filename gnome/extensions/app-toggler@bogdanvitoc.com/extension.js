const Main = imports.ui.main;
const Shell = imports.gi.Shell;
const ExtensionUtils = imports.misc.extensionUtils;

// Extension imports
// docs: https://gjs.guide/extensions/overview/imports-and-modules.html 
const Me = ExtensionUtils.getCurrentExtension();
const Keybinder = Me.imports.keybinder;
const log = Me.imports.logging.log;

// Add apps you want to toggle here simply via their wmclass.
// (find it in the corresponding .desktop file or via looking glass)
// Then configure the keybinding in the settings schema.
const Apps = ["Zeal"];

const Keybindings = Apps.map(wmclass => ({
    key: `toggle-${wmclass.toLowerCase()}`,
    callback: () => toggleApp(wmclass),
}));


function init() {}

function enable() {
    log("extension enable begin");

    Keybinder.bind(Keybindings);

    log("extension enable complete");
}


function disable() {
    log("extension disable begin");

    Keybinder.unbind(Keybindings);

    log("extension disable complete");
}

function toggleApp(wmclass) {
    const appWindow = global.get_window_actors()
        .map(wa => wa.meta_window)
        .find(w => w.wm_class === wmclass);

    // Launch app if window not open
    if (!appWindow) {
        Shell.AppSystem.get_default().lookup_startup_wmclass(wmclass).activate();
    }

    // Focus app if running but not focused
    else if (!appWindow.appears_focused) {
        const activeWorkspace = global.workspace_manager.get_active_workspace_index();
        appWindow.change_workspace_by_index(activeWorkspace, true);
        Main.activateWindow(appWindow);
    }

    // Otherwise minimize app if focused
    // log(`appWindow.appears_focused: ${appWindow.appears_focused}`)
    else {
        appWindow.minimize();
    }
}
