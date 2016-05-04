from ranger.gui.color import *
from ranger.colorschemes.default import Default

class Scheme(Default):
    progress_bar_color = cyan
    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.border:
            fg = white

        if context.directory:
            fg = cyan

        if context.container:
            fg = red
            attr |= bold

        if context.link:
            fg = magenta
            # attr |= bold

        if context.media:
            fg = magenta
            # attr |= bold

        if context.marked:
            fg = green

        if  context.copied:
            fg = yellow

        if  context.cut:
            fg = red

        if context.empty or context.error:
            bg = default
            attr |= bold

        if context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and red or green
            elif context.directory:
                fg = cyan
            elif context.tab:
                if context.good:
                    bg = cyan
            elif context.link:
                fg = magenta

        if context.in_taskview:
            if context.title:
                fg = cyan

        return fg, bg, attr
