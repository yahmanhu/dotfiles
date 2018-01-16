# Settings
# =========

c.url.default_page = '~/.config/newtab/newtab.html'
c.url.start_pages = '~/.config/newtab/newtab.html'
c.tabs.last_close = "default-page"
c.tabs.background = True
c.statusbar.position = 'top'
c.statusbar.hide = True
c.tabs.position = 'top'

# Selected item colors
c.colors.completion.item.selected.bg = '#285577'
c.colors.completion.item.selected.border.top = '#285577'
c.colors.completion.item.selected.border.bottom = '#285577'
c.colors.completion.item.selected.fg = '#ffffff'

# Hint colors
c.colors.hints.bg = '#d60a00'
c.colors.hints.fg = '#ffffff'
c.colors.hints.match.fg = '#d60a00'

# Tab colors
c.colors.tabs.even.bg = 'darkgrey'
c.colors.tabs.even.fg = 'white'
c.colors.tabs.odd.bg = 'darkgrey'
c.colors.tabs.odd.fg = 'white'

c.colors.tabs.selected.even.bg = '#285577'
c.colors.tabs.selected.even.fg = 'white'
c.colors.tabs.selected.odd.bg = '#285577'
c.colors.tabs.selected.odd.fg = 'white'

# Fonts
c.fonts.completion.category = 'bold 10pt monospace'
c.fonts.completion.entry = 'bold 10pt monospace'
c.fonts.statusbar = 'bold 10pt monospace'
c.fonts.tabs = 'bold 10pt monospace'
c.fonts.hints = 'bold 10pt Monospace'

# Download directory
c.downloads.location.directory = '~/downloads'

# Scroll bar
c.scrolling.bar = True

# Commmands
# =========

# Fast scroll
config.bind('J', 'scroll-px 0 200')
config.bind('K', 'scroll-px 0 -200')

# Tab moves
config.bind('<', 'tab-prev')
config.bind('>', 'tab-next')
config.bind('H', 'tab-move -')
config.bind('L', 'tab-move +')
config.bind('g1', 'tab-focus 1')
config.bind('g2', 'tab-focus 2')
config.bind('g3', 'tab-focus 3')
config.bind('g4', 'tab-focus 4')
config.bind('g5', 'tab-focus 5')
config.bind('g6', 'tab-focus 6')

# Bookmark
config.bind('a', 'set-cmd-text -s :bookmark-add')
config.bind('b', 'set-cmd-text -s :bookmark-load -t')
config.bind('D', 'set-cmd-text -s :bookmark-del')

# Move in history
config.bind('<Backspace>', 'back')
config.bind('<Shift+Backspace>', 'forward')

# Open a new tab
config.bind('t', 'set-cmd-text -s :open -t')

# Play with mpv
config.bind('M', 'hint links spawn urxvtc -e mpv {hint-url}')

# Translate word with translate shell
config.bind('T', 'spawn -u ~/.local/share/qutebrowser/userscripts/qutetrans')

# Source config
config.bind('R', 'config-source')

# Select input field
config.bind('I', 'hint inputs')

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "aur": "https://aur.archlinux.org/packages/?K={}",
    "imdb": "http://www.imdb.com/find?s=all&q={}",
    "rarbg": "https://rarbg.to/torrents.php?search={}",
    "tpb": "https://thepiratebay.se/search/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "sz": "https://szinonimaszotar.hu/keres/{}",
    "t": "http://www.thesaurus.com/browse/{}"
}
