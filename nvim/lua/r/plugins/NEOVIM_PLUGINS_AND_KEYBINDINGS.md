# Neovim Configuration - Plugins and Keybindings

This document provides a comprehensive overview of all installed plugins and their keybindings in this Neovim configuration.

## Core Keybindings (from lua/r/core/keymaps.lua)

### Basic Navigation and Editing

- `jk` → Exit insert mode (Insert mode)
- `<leader>w` → Save file
- `<leader>nh` → Clear search highlights
- `<leader>+` → Increment number under cursor
- `<leader>-` → Decrement number under cursor
- `<leader>sv` → Split window vertically
- `<leader>sh` → Split window horizontally
- `<leader>se` → Make split windows equal size
- `<leader>sx` → Close current split window
- `<leader>to` → Open new tab
- `<leader>tx` → Close current tab
- `<leader>tn` → Go to next tab
- `<leader>tp` → Go to previous tab
- `<leader>tf` → Open current buffer in new tab

### Clipboard Operations

- `<leader>y` → Copy to system clipboard (Normal/Visual)
- `<leader>p` → Paste from system clipboard (Normal/Visual)
- `Y` → Copy line to system clipboard

### Buffer and Window Management

- `<C-h>` → Navigate to left window
- `<C-j>` → Navigate to down window
- `<C-k>` → Navigate to up window
- `<C-l>` → Navigate to right window

## Plugin Configurations and Keybindings

### File Exploration and Search

#### 🗂️ FZF-lua (`ibhagwan/fzf-lua`)

**Purpose:** Fast fuzzy finder for files, buffers, and grep
**Keybindings:**

- `<leader>f` → Find files in project root
- `<leader>ffg` → Live grep in project root
- `<leader>fgs` → Git status
- `<leader>fgg` → Git files
- `<leader>fb` → Find buffers
- `<leader>fh` → Search help tags

**LSP Integration:**
- `gR` → Show LSP references
- `gD` → Go to declaration
- `gd` → Show LSP definitions
- `gi` → Show LSP implementations
- `gt` → Show LSP type definitions
- `<leader>lD` → Show buffer diagnostics

#### 🌲 Nvim-tree (`nvim-tree/nvim-tree.lua`)

**Purpose:** File explorer tree
**Keybindings:**

- `<leader>ee` → Toggle file explorer
- `<leader>ef` → Toggle file explorer on current file
- `<leader>ec` → Collapse file explorer
- `<leader>er` → Refresh file explorer

#### 🔍 CtrlSF (`dyng/ctrlsf.vim`)

**Purpose:** Advanced search and replace
**Keybindings:**

- `<C-F>f` → Open CtrlSF search

#### 🔧 Telescope (`nvim-telescope/telescope.nvim`)

**Purpose:** Minimal telescope setup for plugin dependencies
**Note:** Used only as dependency, primary searching is done with FZF-lua

### LSP and Code Intelligence

#### 🧠 LSP Config (`neovim/nvim-lspconfig`)

**Purpose:** Language Server Protocol integration
**Keybindings:**

- `gR` → Show LSP references (FzfLua)
- `gD` → Go to declaration
- `gd` → Show LSP definitions (FzfLua)
- `gi` → Show LSP implementations (FzfLua)
- `gt` → Show LSP type definitions (FzfLua)
- `<leader>ca` → See available code actions
- `<leader>rn` → Smart rename
- `<leader>D` → Show buffer diagnostics (FzfLua)
- `<leader>d` → Show line diagnostics
- `[d` → Go to previous diagnostic
- `]d` → Go to next diagnostic
- `K` → Show documentation for item under cursor
- `<leader>rs` → Restart LSP

**Configured Language Servers:**

- HTML (`html`)
- TypeScript/JavaScript (`ts_ls`)
- Go (`gopls`)
- CSS (`cssls`)
- Tailwind CSS (`tailwindcss`)
- Svelte (`svelte`)
- Prisma (`prismals`)
- GraphQL (`graphql`)
- Emmet (`emmet_ls`)
- Python (`pyright`)
- Lua (`lua_ls`)

#### 🎯 Treesitter (`nvim-treesitter/nvim-treesitter`)

**Purpose:** Syntax highlighting and code understanding
**Keybindings:**

- `<C-space>` → Initialize/expand selection
- `<bs>` → Shrink selection

**Features:**

- Enhanced syntax highlighting
- Auto-indentation
- Auto-tagging for HTML/JSX
- Incremental selection

### Code Completion and Snippets

#### 💡 Nvim-cmp (`hrsh7th/nvim-cmp`)

**Purpose:** Autocompletion engine
**Keybindings (Insert mode):**

- `<C-k>` → Previous suggestion
- `<C-j>` → Next suggestion
- `<C-b>` → Scroll docs up
- `<C-f>` → Scroll docs down
- `<C-Space>` → Show completion suggestions
- `<C-e>` → Close completion window
- `<CR>` → Confirm selection

**Sources:**

- LSP completions
- Snippets (LuaSnip)
- Buffer text
- File paths

#### 🔤 LuaSnip (`L3MON4D3/LuaSnip`)

**Purpose:** Snippet engine
**Integration:** Works with nvim-cmp for snippet expansion

### Formatting and Linting

#### ✨ Conform (`stevearc/conform.nvim`)

**Purpose:** Code formatting
**Keybindings:**

- `<leader>mp` → Format file or range (Normal/Visual)

**Formatters by filetype:**

- JavaScript/TypeScript: Prettier
- HTML/CSS/JSON/YAML/Markdown: Prettier
- Lua: Stylua
- Python: isort + black
- Svelte: Prettier
- GraphQL: Prettier

#### 🔍 Nvim-lint (`mfussenegger/nvim-lint`)

**Purpose:** Linting
**Keybindings:**

- `<leader>l` → Trigger linting for current file

**Linters by filetype:**

- JavaScript/TypeScript/React: eslint_d
- Svelte: eslint_d
- Python: pylint

### Git Integration

#### 🔀 Fugitive (`tpope/vim-fugitive`)

**Purpose:** Git integration
**Keybindings:**

- `<leader>gc` → Git commit with message prompt
- `<leader>gs` → Git status
- `<leader>gp` → Git push
- `<leader>gP` → Git push with upstream setting

#### 📊 Gitsigns (`lewis6991/gitsigns.nvim`)

**Purpose:** Git signs in gutter
**Features:** Shows git changes in sign column (auto-configured)

#### 🖥️ Lazygit (`kdheepak/lazygit.nvim`)

**Purpose:** Terminal UI for git
**Keybindings:**

- `<leader>gg` → Open lazygit
- `<leader>gf` → Open lazygit for current file
- `<leader>gr` → Open lazygit at repo root

### Code Editing and Text Objects

#### 💬 Comment (`numToStr/Comment.nvim`)

**Purpose:** Smart commenting
**Default keybindings:**

- `gcc` → Toggle line comment
- `gbc` → Toggle block comment
- `gc` → Toggle comment (Visual mode)

#### 🔄 Nvim-surround (`kylechui/nvim-surround`)

**Purpose:** Manipulate surrounding characters
**Default keybindings:**

- `ys{motion}{char}` → Add surrounding
- `ds{char}` → Delete surrounding
- `cs{old}{new}` → Change surrounding

#### 🤖 Nvim-autopairs (`windwp/nvim-autopairs`)

**Purpose:** Auto-close brackets, quotes, etc.
**Features:** Automatically inserts closing pairs

### Window and Session Management

#### 📏 Vim-maximizer (`szw/vim-maximizer`)

**Purpose:** Maximize/minimize splits
**Keybindings:**

- `<leader>sm` → Maximize/minimize a split

#### 🏷️ Tagbar (`preservim/tagbar`)

**Purpose:** Code structure overview
**Commands:** `:TagbarToggle`

### GitHub Integration

#### 🐙 Octohub (`2kabhishek/octohub.nvim`)

**Purpose:** GitHub repository browser
**Keybindings:**

- `<leader>goa` → Activity stats
- `<leader>goA` → All repos
- `<leader>gob` → Repos by creation
- `<leader>goc` → Contribution stats
- `<leader>gof` → Repos by forks
- `<leader>goF` → Forked repos
- `<leader>gog` → Repos by language
- `<leader>goi` → Repos by issues
- `<leader>gol` → Repos by name
- `<leader>goo` → Open repo
- `<leader>gop` → Profile
- `<leader>goP` → Private repos
- `<leader>gor` → Repo stats
- `<leader>gos` → Repos by stars
- `<leader>goS` → Starred repos
- `<leader>got` → Template repos
- `<leader>goT` → Repos by updated
- `<leader>gou` → Repos by size
- `<leader>goU` → Repos by pushed
- `<leader>gow` → Open repo in web

### UI and Visual Enhancements

#### ✨ Lualine (`nvim-lualine/lualine.nvim`)

**Purpose:** Status line
**Features:**

- VS Code Dark+ custom color theme
- File path section (`lualine_c`) shows the last 3 folders + filename
- File encoding/format
- Lazy.nvim update notifications

#### 📚 Colorscheme — VS Code Dark+ (`Mofiqul/vscode.nvim`)

**Purpose:** Dark+ editor theme
**Features:**

- `colorscheme vscode` set in `init.lua`
- Declared in `colorscheme.lua` (`style = "dark"`)
- Install default in `lazy_config.lua`

#### 💾 Persistence (`folke/persistence.nvim`)

**Purpose:** Session management
**Keybindings:**

- `<leader>qs` → Restore session (cwd)
- `<leader>qS` → Select session
- `<leader>ql` → Restore last session
- `<leader>qd` → Stop saving current session

**Features:** Loads on `BufReadPre`, auto-saves on quit.

#### 🧩 Snacks Dashboard & Terminal (`folke/snacks.nvim`)

**Purpose:** Startup dashboard + terminal + glow markdown review
**Features:**

- Startup dashboard listing recent sessions (from persistence) + quick keys
- `<leader>mg` / `:Glow` → render current markdown buffer in glow
- Terminal/picker/input used by `opencode.nvim`

#### 🔎 DAP Value Helpers (`dap.lua`)

**Purpose:** Copy / log / diff inspected values during a debug session
**Keybindings:**

- `<leader>dy` → copy an evaluated value to the clipboard
- `<leader>dY` → append an evaluated value to the current run's log

**Command:** `:DapDiffRuns` — diffs the two newest run logs
(`stdpath("state")/dap-values/run-*.txt`).

#### 🔩 FZF Worktree Picker (`fzf.lua`)

**Purpose:** Open/diff the current file from another git worktree
**Keybindings:**

- `<leader>fw` → pick a git worktree, open current file there in a vsplit
  (`<C-d>` inside the picker diffs against it)

#### 🔕 Noice (`folke/noice.nvim`)

**Purpose:** Enhanced UI for messages, cmdline and popupmenu
**Features:**

- Bottom search
- Command palette
- Long message routing

#### 🌈 Nvim-web-devicons (`nvim-tree/nvim-web-devicons`)

**Purpose:** File type icons
**Features:** Provides icons for various file types

#### 📋 Which-key (`folke/which-key.nvim`)

**Purpose:** Keybinding hints
**Features:** Shows available keybindings after leader key

#### 📐 Indent Guides (`nathanaelkane/vim-indent-guides`)

**Purpose:** Visual indentation guides
**Features:** Shows indentation levels with colored guides

### Disabled/Conflict Resolution

#### ❌ Prettier (`prettier/vim-prettier`)

**Status:** Disabled
**Reason:** Conflicts with conform.nvim formatting

### 📄 Personal Docs & Markdown Review (`docs.lua` / `fzf.lua`)

**Purpose:** Search and browse `~/personal/docs` from Neovim, and review any
markdown file with [glow](https://github.com/charmbracelet/glow).

**Keybindings:**

- `<leader>df` → Find files in `~/personal/docs` (fzf-lua)
- `<leader>ds` → Live-grep the contents of `~/personal/docs` (fzf-lua)
- `<leader>de` → Open `~/personal/docs` in nvim-tree file explorer
- `<leader>mg` → Render the current markdown buffer with glow in a terminal pane
- `:Glow` → Command alias for `<leader>mg`

**Notes:**

- Docs root is hardcoded to `~` + `/personal/docs` (edit in `fzf.lua`).
- The `df`/`ds`/`de` bindings are defined in `fzf.lua` (so they live with the
  other fzf-lua bindings); the `Glow` command lives in `snacks.lua`.
- `<leader>mg` / `:Glow` only act on `markdown` filetype buffers.
- Requires the `glow` binary: `brew install charmbracelet/tap/glow`.

## Installation and Dependencies

### External Tools Required

- `fd` - Fast file finder (for FZF-lua)
- `git` - Version control
- `glow` - Terminal markdown renderer (for markdown review via snacks)
- Language servers (installed via `:Mason` or system package manager)
- Formatters: prettier, stylua, isort, black
- Linters: eslint_d, pylint

### Plugin Manager

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Notes

1. **Leader Key:** The leader key is set to `<Space>` in the core configuration
2. **LSP Integration:** All LSP commands are integrated with FZF-lua for consistent UI
3. **Conflict Resolution:** Keybinding conflicts resolved between Fugitive and FZF-lua
4. **Git Workflow:** Comprehensive git integration with Fugitive, Gitsigns, and Lazygit
5. **Code Quality:** Automatic formatting and linting on save for supported file types

## Customization

To modify keybindings or add new plugins:

1. Core keybindings: Edit `lua/r/core/keymaps.lua`
2. Plugin configurations: Edit files in `lua/r/plugins/`
3. Plugin list: Add new plugins to `lua/r/plugins/` directory
4. LSP settings: Modify `lua/r/plugins/lsp/lspconfig.lua`

This configuration prioritizes performance, code quality, and developer experience with modern Neovim features.
