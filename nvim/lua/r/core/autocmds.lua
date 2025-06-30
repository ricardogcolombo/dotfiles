-- Autocommands converted from old.vim
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

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

-- Indent guides colors
local indent_group = augroup("IndentGuides", { clear = true })
autocmd({ "VimEnter", "Colorscheme" }, {
  group = indent_group,
  callback = function()
    vim.cmd("hi IndentGuidesOdd  guibg=red   ctermbg=3")
    vim.cmd("hi IndentGuidesEven guibg=green ctermbg=4")
  end,
  desc = "Set indent guide colors"
})

-- Syntax settings
local syntax_group = augroup("SyntaxSettings", { clear = true })
autocmd({ "BufNewFile", "BufRead" }, {
  group = syntax_group,
  pattern = "*.tsx",
  callback = function()
    vim.bo.filetype = "typescript"
  end,
  desc = "Set tsx files as typescript"
})

autocmd({ "BufNewFile", "BufRead" }, {
  group = syntax_group,
  pattern = "*.less",
  callback = function()
    vim.bo.filetype = "css"
  end,
  desc = "Set less files as css"
})

-- Auto change directory to file location
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local dir = vim.fn.expand("%:p:h")
    if vim.fn.isdirectory(dir) == 1 then
      vim.cmd("silent! lcd " .. dir)
    end
  end,
  desc = "Auto change directory to file location"
})

