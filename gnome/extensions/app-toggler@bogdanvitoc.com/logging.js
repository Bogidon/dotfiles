let debug = true;

/**
 * If called with a false argument, log statements are suppressed.
 */
function setLoggingEnabled(enabled) {
    debug = enabled;
}

/**
 * Log logs the given message using the gnome shell logger (global.log) if the
 * debug variable is set to true.
 *
 * Debug messages may be viewed using the bash command `journalctl
 * /usr/bin/gnome-shell` and grepping the results for 'toggler'.
 */
function log(message) {
    if(debug) {
        global.log("app-toggler: " + message);
    }
}