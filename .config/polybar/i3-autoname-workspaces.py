
# This script listens for i3 events and updates workspace names to show icons
# for running programs.  It contains icons for a few programs, but more can
# easily be added by inserting them into WINDOW_ICONS below.
#
# Dependencies
# * xorg-xprop - install through system package manager
# * i3ipc - install with pip or through the AUR
#
# Installation:
# * Download this script and place it in ~/.config/i3/ (or anywhere you want)
# * Add "exec_always python3 ~/.i3/i3-autoname-workspaces.py" to your i3 config
# * Restart i3: "$ i3-msg restart"
#
# Configuration:
# The default i3 config's keybingings reference workspaces by name, which is an
# issue when using this script because the names are constantaly changing to
# show window icons.  Instead, you'll need to change the keybindings to
# reference workspaces by number.  Change lines like:
#   bindsym $mod+1 workspace 1
# To:
#   bindsym $mod+1 workspace number 1
#
# Forked from Justin Buchanan
# https://gist.github.com/justbuchanan/70fdae0d5182f6039aa8383c06a3f4ad
# https://github.com/justbuchanan/i3scripts/blob/master/autoname_workspaces.py
#
# Todo list:

import i3ipc
import subprocess as proc
import re
import signal
import sys


# Add icons here for common programs you use.  The keys are the X window class
# (WM_CLASS) names and the icons can be any text you want to display. However
# most of these are character codes for font awesome:
#  http://fortawesome.github.io/Font-Awesome/icons/
#  https://www.nerdfonts.com/cheat-sheet
FA_CALCULATOR = '\uf1ec'
FA_CHROME = '\uf268'
FA_CODE = '\uf121'
FA_FILE_PDF_O = '\uf1c1'
FA_FILE_TEXT_O = '\uf0f6'
FA_FILE_EXCEL_O = '\uf1c3'
FA_RSS_SQUARE = '\uf143'
FA_FILES_O = '\uf0c5'
FA_FIREFOX = '\uf269'
FA_ENVELOPE_O = '\uf0e0'
FA_EYEDROPPER = '\uf1fb'
FA_MUSIC = '\uf001'
FA_PICTURE_O = '\uf03e'
FA_KEY = '\uf084'
FA_TERMINAL = '\uf489'
FA_CUBE = '\uf1b2'
FA_PLAY_CIRCLE = '\uf144'
FA_DOWNLOAD = '\uf019'
FA_VOLUME_UP = '\uf028'
FA_STEAM = '\uf1b6'
FA_PAINTBRUSH = '\uf1fc'
FA_FILM = '\uf008'
FA_MAP_O = '\uf278'
FA_DATABASE = '\uf1c0'
FA_TELEGRAM = '\uf2c6'
FA_SLACK = '\uf198'
FA_CLOCK_O = '\uf017'
FA_ROCKET = '\uf135'
NF_MDI_WINDOWS = '\ufab2'
NF_DEV_GIT_COMPARE = '\uf47f'
NF_FA_VIDEO_CAMERA = '\uf03d'
WINDOW_ICONS = {
    'Alacritty': FA_TERMINAL,
    'Galculator': FA_CALCULATOR,
    'telegram-desktop': FA_TELEGRAM,
    'Slack': FA_SLACK,
    'Google-chrome': FA_CHROME,
    'google-chrome': FA_CHROME,
    'chromium': FA_CHROME,
    'gvim': FA_CODE,
    'firefox': FA_FIREFOX,
    'thunderbird': FA_ENVELOPE_O,
    'libreoffice-calc': FA_FILE_EXCEL_O,
    'libreoffice': FA_FILE_TEXT_O,
    'gpodder': FA_RSS_SQUARE,
    'feh': FA_PICTURE_O,
    'gcolor2': FA_EYEDROPPER,
    'atril': FA_FILE_PDF_O,
    'PdfMod': FA_FILE_PDF_O,
    'pcmanfm': FA_FILES_O,
    'gimp': FA_PAINTBRUSH,
    'gimp-2.10': FA_PAINTBRUSH,
    'VirtualBox': FA_CUBE,
    'mpv': FA_PLAY_CIRCLE,
    'Kodi': FA_PLAY_CIRCLE,
    'obs': FA_PLAY_CIRCLE,
    'rhythmbox': FA_MUSIC,
    'transmission-gtk': FA_DOWNLOAD,
    'pavucontrol': FA_VOLUME_UP,
    'pulseeffects': FA_VOLUME_UP,
    'Steam': FA_STEAM,
    'SWT': FA_DATABASE,
    'DBeaver': FA_DATABASE,
    'KeeWeb': FA_KEY,
    'Postman': FA_ROCKET,
    'Microsoft Teams - Preview': NF_MDI_WINDOWS,
    'Meld': NF_DEV_GIT_COMPARE,
    'zoom': NF_FA_VIDEO_CAMERA,
}


i3 = i3ipc.Connection()

# Returns an array of the values for the given property from xprop.  This
# requires xorg-xprop to be installed.
def xprop(win_id, property):
    try:
        prop = proc.check_output(['xprop', '-id', str(win_id), property], stderr=proc.DEVNULL)
        prop = prop.decode('utf-8')
        return re.findall('"([^"]+)"', prop)
    except proc.CalledProcessError as e:
        print("Unable to get property for window '%s'" % str(win_id))
        return None

def icon_for_terminal_app(window):
    names = xprop(window.window, 'WM_NAME')
    print(names)
    if names != None and len(names) > 0:
        for name in names:
            if name in WINDOW_ICONS:
                return WINDOW_ICONS[name]

def icon_for_window(window):
    classes = xprop(window.window, 'WM_CLASS')
    if classes != None and len(classes) > 0:
        for cls in classes:
            if cls in WINDOW_ICONS:
                return WINDOW_ICONS[cls] + ' '
        print('No icon available for window with classes: %s' % str(classes))
    return '*'

# renames all workspaces based on the windows present
def rename():
    for workspace in i3.get_tree().workspaces():
        icons = [icon_for_window(w) for w in workspace.leaves()]
        icon_str = ': ' + ' '.join(icons) if len(icons) else ''
        new_name = str(workspace.num) + icon_str
        i3.command('rename workspace "%s" to "%s"' % (workspace.name, new_name))

rename()

# exit gracefully when ctrl+c is pressed
def signal_handler(signal, frame):
    # rename workspaces to just numbers on exit to indicate that this script is
    # no longer running
    for workspace in i3.get_tree().workspaces():
        i3.command('rename workspace "%s" to "%d"' % (workspace.name, workspace.num))
    i3.main_quit()
    sys.exit(0)
signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)

# call rename() for relevant window events
def on_change(i3, e):
    if e.change in ['new', 'close', 'move']:
        rename()
i3.on('window', on_change)
i3.main()
