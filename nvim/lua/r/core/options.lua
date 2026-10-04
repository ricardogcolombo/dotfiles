-- Basic Vim settings converted from old.vim
local opt = vim.opt
local g = vim.g

-- Basic settings
opt.compatible = false
opt.termguicolors = true
opt.background = "dark"
opt.encoding = "utf8"
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8"
opt.bomb = true

-- NOTE: binary mode was previously enabled globally (opt.binary = true). It
-- disables many editing features for every file, so it has been removed.

-- Mouse and clipboard
opt.mouse = "a"
opt.clipboard = "unnamed"

-- No wrap and swap files
opt.wrap = false
opt.backup = false
opt.swapfile = false

-- Search settings
opt.incsearch = true
opt.hlsearch = true
opt.showmatch = true

-- Tab settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.showtabline = 2
opt.expandtab = true

-- Display settings
opt.showmode = false
opt.laststatus = 2
opt.autowrite = true
opt.autoread = true
opt.hidden = true
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess:append("c")
opt.signcolumn = "yes"
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.cursorcolumn = true
opt.colorcolumn = "80"

-- Folding
opt.foldmethod = "indent"
opt.foldenable = false

-- Spell checking
opt.spell = true
opt.spelllang = "en_us"

-- Working directory: previously `autochdir = true` (plus a BufEnter :lcd autocmd)
-- changed the cwd to every file's folder. That fragments project-root detection
-- (sessions, fzf, LSP) so it is intentionally disabled. Use :cd/:lcd manually
-- or the `rooter`-style plugins if you want per-project cd.

-- Path settings
opt.path:append("**")

-- Matchpairs
opt.matchpairs:append("<:>")

-- Viminfo
opt.viminfo:append("%")

-- Global variables
g.vim_tags_auto_generate = 1
g.jsx_ext_required = 0
g.tern_map_keys = 1
g.tern_show_argument_hints = "on_hold"
g.python_highlight_all = 1
g.base16colorspace = 256
g.used_javascript_libs = "underscore,backbone,angularjs,react,flux,requirejs,angularuirouter,jasmine"

-- Ack configuration
if vim.fn.executable("ag") == 1 then
  g.ackprg = "ag --vimgrep"
else
  g.ackprg = "ag --nogroup --nocolor --column"
end

-- Indent guides
g.indent_guides_auto_colors = 0

