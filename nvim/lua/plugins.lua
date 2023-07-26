return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim' }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'shaunsingh/nord.nvim'
    use {'sainnhe/everforest'}

    use {'sheerun/vim-polyglot'}

    use { 'folke/lua-dev.nvim' }
    use({
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup({
                -- overwrite default configuration
                -- here, e.g. to enable default bindings
                copy_sync = {
                    -- enables copy sync and overwrites all register actions to
                    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
                    enable = true,
                },
                navigation = {
                    -- enables default keybindings (C-hjkl) for normal mode
                    enable_default_keybindings = true,
                },
                resize = {
                    -- enables default keybindings (A-hjkl) for normal mode
                    enable_default_keybindings = true,
                }
            })
        end
    })
    use { 'nvim-lua/completion-nvim' }
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use { 'ray-x/lsp_signature.nvim' }
    use {'t9md/vim-choosewin'}

    use 'tpope/vim-surround'
    use 'editorconfig/editorconfig-vim'

    use 'easymotion/vim-easymotion'

    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use'junegunn/fzf.vim'

    use 'hrsh7th/nvim-compe'
    use 'tjdevries/nlua.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-treesitter/nvim-treesitter'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            {'nvim-telescope/telescope-symbols.nvim'},
        }
    }


    use { 'dyng/ctrlsf.vim' }

    use 'neovim/node-client'
    use 'python-mode/python-mode'

    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'mileszs/ack.vim'


    use 'vim-test/vim-test'

    use 'skanehira/docker-compose.vim'

    use 'tpope/vim-markdown'
    use 'tpope/vim-commentary'

    use 'hashivim/vim-terraform'
    use 'leafgarland/typescript-vim'

    -- Snippets
    use {  'honza/vim-snippets' }
    use { 'SirVer/ultisnips' }
    use {'norcalli/snippets.nvim'}

    -- -- Lazy loading:
    -- -- Load on specific commands
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'prettier/vim-prettier',  run='yarn install' }

    use({
        "winston0410/commented.nvim",
        config = function()
            require("commented").setup({
                codetags_keybindings = {
                    fixme = "<leader>fi",
                    fixme_line = "<leader>fm",
                    todo = "<leader>t",
                    todo_line = "<leader>tt",
                    bug = "<leader>b",
                    bug_line = "<leader>bb",
                    note = "<leader>n",
                    note_line = "<leader>nn",
                    wont_fix = "<leader>w",
                    wont_fix_line = "<leader>ww",
                },
            })
        end,
    })

    use 'chriskempson/base16-vim'
    use 'EdenEast/nightfox.nvim'
    use 'morhetz/gruvbox'
    use {'nvim-treesitter/nvim-treesitter'}
    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end
}
end)


