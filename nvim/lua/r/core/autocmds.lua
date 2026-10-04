-- Autocommands converted from old.vim
local autocmd = vim.api.nvim_create_autocmd

-- Return to last edit position when opening files
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
  desc = "Return to last edit position"
})

-- NOTE: previously *.tsx was forced to filetype `typescript` and *.less to
-- `css`. Neovim already detects .tsx as `typescriptreact` and .less as `less`,
-- and forcing `typescript` made ts_ls/Treesitter parse JSX as plain TS (bogus
-- syntax + "unused variable" errors). Both overrides were removed.

-- NOTE: a BufEnter autocmd used to run `silent! lcd` into every file's folder,
-- duplicating `autochdir` and fragmenting project-root detection. Removed.

