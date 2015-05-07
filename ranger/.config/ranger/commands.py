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
    """
    def execute(self):
        self.fm.run("trash-empty")

class trestore(Command):
    """:trestore

    Restores file(s) from the Trash directory:
    ~/.local/share/Trash/
    """
    def execute(self):
        self.fm.run("cd ~ && trash-restore")

class mount1(Command):
    """:mount1
    Mounts /dev/sdb1 usb drive to /media/rio
    """
    def execute(self):
        self.fm.run("sudo mount /dev/sdb1 /media/rio")

class umount1(Command):
    """:umount1
    Unmounts /dev/sdb1 usb drive
    """
    def execute(self):
        self.fm.run("sudo umount /dev/sdb1")
