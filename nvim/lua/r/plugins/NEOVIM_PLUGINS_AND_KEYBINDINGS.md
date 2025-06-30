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
- `<leader>fg` → Live grep in project root
- `<leader>b` → Find buffers
- `<leader>h` → Search help tags

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
- `<leader>gp` → **Git push** (your requested keybinding)
- `<leader>gP` → Git push with upstream setting

#### 📊 Gitsigns (`lewis6991/gitsigns.nvim`)

**Purpose:** Git signs in gutter
**Features:** Shows git changes in sign column (auto-configured)

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

### AI and Chat Integration

#### 🤖 Avante (`yetone/avante.nvim`)

**Purpose:** AI coding assistant
**Configuration:**

- Provider: Gemini
- Model: Gemini Flash 2.5
- Default AI chat interface

#### 💬 ChatGPT (`jackMort/ChatGPT.nvim`)

**Purpose:** ChatGPT integration
**Configuration:** Uses 1Password for API key management

#### 👨‍💻 GitHub Copilot (`github/copilot.vim` + `CopilotC-Nvim/CopilotChat.nvim`)

**Purpose:** GitHub Copilot integration
**Features:** Code suggestions and chat interface

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

- Custom color theme
- Git branch info
- File encoding/format
- Lazy.nvim update notifications

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

### Search and Replace

#### 🔍 Ack (`mileszs/ack.vim`)

**Purpose:** Search tool integration
**Configuration:** Uses `ag` (the_silver_searcher) if available

### Disabled/Conflict Resolution

#### ❌ Prettier (`prettier/vim-prettier`)

**Status:** Disabled
**Reason:** Conflicts with conform.nvim formatting

## Installation and Dependencies

### External Tools Required

- `fd` - Fast file finder (for FZF-lua)
- `ag` (the_silver_searcher) - For Ack plugin
- `git` - Version control
- Language servers (installed via `:Mason` or system package manager)
- Formatters: prettier, stylua, isort, black
- Linters: eslint_d, pylint

### Plugin Manager

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Notes

1. **Leader Key:** The leader key is set to `<Space>` in the core configuration
2. **LSP Integration:** All LSP commands are integrated with FZF-lua for consistent UI
3. **Conflict Resolution:** Keybinding conflicts resolved between Fugitive and FZF-lua
4. **AI Integration:** Multiple AI tools are configured (Avante, ChatGPT, Copilot) for different use cases
5. **Git Workflow:** Comprehensive git integration with fugitive and gitsigns
6. **Code Quality:** Automatic formatting and linting on save for supported file types

## Customization

To modify keybindings or add new plugins:

1. Core keybindings: Edit `lua/r/core/keymaps.lua`
2. Plugin configurations: Edit files in `lua/r/plugins/`
3. Plugin list: Add new plugins to `lua/r/plugins/` directory
4. LSP settings: Modify `lua/r/plugins/lsp/lspconfig.lua`

This configuration prioritizes performance, code quality, and developer experience with modern Neovim features.
