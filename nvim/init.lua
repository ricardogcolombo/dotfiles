require('settings')
require('plugins')

vim.cmd('source $HOME/.config/nvim/lua/old.vim')
vim.cmd('set background=dark')
vim.cmd('colorscheme onedark')
local custom_onedark= require'lualine.themes.onedark'

-- Change the background of lualine_c section for normal mode
custom_onedark.normal.c.bg = '#112233'

require('lualine').setup({
 options = { theme  = custom_onedark }
 })

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "tsserver" },
}
require('keymappings')
require('telescope')

require('choosewin')
require("lang")

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}



vim.cmd('source $HOME/.config/nvim/lua/vim_modules/easymotion.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/ctrlsf.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/git.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/autocomplete.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/numbers.vim')

