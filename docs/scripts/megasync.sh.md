# MegaSync launcher (Qt env overrides)

---

**megasync.sh**: Launches `megasync` with env vars to avoid Qt theme/desktop issues

---

### Dependencies

- `megasync` — MEGA desktop sync client (AUR/community package on Arch)
- `bash`

### Description

This is a tiny wrapper around `megasync` meant for a Qtile/Arch desktop where Qt applications sometimes pick up unwanted platform theme integration or “desktop settings unaware” behavior (typically via KDE/GNOME environment hooks, `xdg-desktop-portal`, or theme engines).

It runs `megasync` with two environment variables set for that process only:

- `DO_NOT_UNSET_QT_QPA_PLATFORMTHEME=1`
- `DO_NOT_SET_DESKTOP_SETTINGS_UNAWARE=1`

In practice, these flags can help keep MEGAsync from changing (or being changed by) global Qt platform theme settings and can reduce visual glitches, theme mismatches, or odd font/icon behavior when running outside a full KDE session (common with qtile).

Because the variables are exported inline, they affect only the `megasync` process spawned by this script, not your whole session.

### Usage

Run it from a terminal:

    ~/.scripts/dev/megasync.sh

Make it executable if needed:

    chmod +x ~/.scripts/dev/megasync.sh

Typical Qtile usage (keybinding/spawn):

- In your qtile config, call it via `lazy.spawn("~/.scripts/dev/megasync.sh")`
- Or add it to your autostart if you want MEGAsync always running after login.

Quick “tldr”:

    # start MEGAsync with the intended Qt env overrides
    megasync.sh

---

> [!TIP]
> Consider using `exec megasync` as the last command to avoid an extra shell process: `... exec megasync`. Also, if you ever need to debug whether these variables still matter, log the environment or temporarily remove them to confirm they’re still required on your current Qt/MEGAsync version.