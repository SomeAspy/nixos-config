# TODO

- config gram with nix somehow
- change rbw email to amb@aspy.dev probably
- same for firefox maybe
- disko?????
- install a vpn to bypass filters of school i work at (so i can shitpost on discord at work)
- fix PCR issues on both laptop and desktop (Jul 16 20:41:49 amb-laptop systemd-cryptsetup[190]: Couldn't find pcrlock policy for volume.)
- fix laptop bluetooth being disabled at boot (possibly related: Jul 16 20:42:00 amb-laptop bluetoothd[917]: Failed to set default system config for hci0)
- probably adjust niceness of nix build so it doesn't lock up my laptop
- Touchpad on laptop may need more adjusting (Jul 16 20:48:20 amb-laptop kwin_wayland[2118]: Libinput: event9  - SYNA8008:00 06CB:CE58 Touchpad: kernel bug: Touch jump detected and discarded.
                                               See https://wayland.freedesktop.org/libinput/doc/1.31.3/touchpad-jumping-cursors.html for details)
- flatpak still seems to be fucking up (Jul 17 09:05:57 amb-laptop 72mh78q6bpqdm2s8scqak4lfp28r8q1l-flatpak-managed-install[84543]: error: Unable to load summary from remote flathub: While fetching https://dl.flathub.org/repo/sum>
Jul 17 09:05:57 amb-laptop systemd[1]: flatpak-managed-install-timer.service: Main process exited, code=exited, status=1/FAILURE
Jul 17 09:05:57 amb-laptop systemd[1]: flatpak-managed-install-timer.service: Failed with result 'exit-code'.
Jul 17 09:05:57 amb-laptop systemd[1]: Failed to start flatpak-managed-install-timer.service.)
- Rejecting bluetooth headphones? (Jul 17 09:06:33 amb-laptop bluetoothd[917]: profiles/input/device.c:hidp_add_connection() Rejected connection from !bonded device /org/bluez/hci0/dev_58_18_62_26_74_FF)
- maybe make bambu lab work (nix package builds from source, flatpak doesnt work, nor does appimage with nix-ld)
- make git always recognize rbw and prompt to unlock instead of failing (error: Couldn't get agent socket?)
