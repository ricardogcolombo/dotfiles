return require('packer').startup(function(use)
	-- Packer can manage itself
    use {'wbthomason/packer.nvim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'folke/lua-dev.nvim' }

    use { 'nvim-lua/completion-nvim' }
    use { "williamboman/mason.nvim" }
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
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }



    use { 'dyng/ctrlsf.vim' }

    use 'neovim/node-client'
	use 'python-mode/python-mode'


	use 'itchyny/lightline.vim'
	use 'shinchu/lightline-gruvbox.vim'


	use 'mileszs/ack.vim'


	use 'vim-test/vim-test'

	use 'skanehira/docker-compose.vim'

	use 'tpope/vim-markdown'
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
    use {
      "numToStr/Comment.nvim",
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("config.comment").setup()
      end,
    }
	use 'chriskempson/base16-vim'
    
	use 'morhetz/gruvbox'
end)


