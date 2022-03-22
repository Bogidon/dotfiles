File for collecting notes on various fragments of system configuration that either can't be made deterministic or I haven't yet spent the time to try.

# Linux

## Sublime
- Better to install via native package managers than flathub due to better updates. https://www.sublimetext.com/docs/linux_repositories.html#yum
- Preference sync: location for user preferences is `~/.config/sublime-text/`
- If installing via flathub:
  - Sync: user preferences in `~/.var/app/com.sublimetext.three/config/sublime-text-3/Packages` (on Fedora35 Sublime3)
  - binary must be symlinked for `subl` command `ln -s /var/lib/flatpak/exports/bin/com.sublimetext.three /usr/local/bin/subl`. From: https://github.com/flathub/com.sublimetext.three/issues/24

## Tweaking the desktop
- Gnome extensions: very useful. I should figure out how to save ones I am using to dotfiles.
- Gnome Tweak Tool

## Window Management
- gTile is like Divvy but better.
  - how to export settings: https://github.com/gTile/gTile/issues/121

## Special Character input
Ibus installed by default: https://wiki.archlinux.org/title/IBus#Emoji_input

## Images
- image viewer:
	- gThumbnail (chosen) - more capable image viewer than the built in one
	- alternatives: XnView, Shotwell, Darktable (full photo organization)


# Framework Laptop

## Acceleration
- https://community.frame.work/t/linux-battery-life-tuning
```
GPU rendering with Firefox and Chrome (WIP)
    Install igt-gpu-tools
    Ensure that intel_gpu_top is showing GPU usage when watching video on browser.
    Firefox 92 → about:config → layers.acceleration.force-enabled
```


## Power
- Getting deep sleep working: https://community.frame.work/t/fedora-34-on-the-framework-laptop/2723/49?u=bogdan_vitoc
  - but keeping my luks uuid for disk encryption
- Installed TLP

## Bluetooth Issues
Disabling autosuspend of bluetooth devices:
sudo grubby --update-kernel /boot/vmlinuz-5.15.6-200.fc35.x86_64 --args="btusb.enable_autosuspend=0"
from: https://bugzilla.redhat.com/show_bug.cgi?id=1589548
how to add kernel command line args: https://fedoramagazine.org/setting-kernel-command-line-arguments-with-fedora-30/

problems with bluetooth adapter after "warm boot" (i.e. restart): https://bugzilla.kernel.org/show_bug.cgi?id=213829#c26
supposedly fixed in kernel 5.15.6-ish

This was fixed by updating to 5.16.11 (though I also disabled autosuspend and didn't test independently so could have been that).

## Displays
Had an issue with my Dell U2421E monitor being locked to 30hz when used over USB-C-to-C w/ PD. Swapped for HDMI-HDMI, no issue. Displayport-to-USB-C, no issue. Back to USB-C-to-C, now no issue! Works with 60fps.