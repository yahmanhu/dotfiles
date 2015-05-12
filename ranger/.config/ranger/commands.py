#======================
# User defined commands
#======================

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import *

# You can import any python module as needed.
import os

class tempty(Command):
    """:tempty

    Empties the Trash directory:
    ~/.local/share/Trash/
    Requires trash-cli
    """
    def execute(self):
        self.fm.run("trash-empty")

class trestore(Command):
    """:trestore

    Restores file(s) from the Trash directory:
    ~/.local/share/Trash/
    Requires trash-cli
    """
    def execute(self):
        self.fm.run("cd ~ && trash-restore")

class mpv(Command):
    """:mpv

    Watch videos from mpv watch_later directory
    Copy's the first line from an mpv watch later config file to the clipboard, then runs the video with mpv
    (Only works with mpv watch later config files!)
    Requires mpv, awk, xsel
    """

    def execute(self):
        self.fm.execute_console("shell awk 'NR==1' %s | xsel -b && mpv `xsel -b`")
