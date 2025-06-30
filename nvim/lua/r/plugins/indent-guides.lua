-- Indent guides plugin configuration
return {
  "nathanaelkane/vim-indent-guides",
  config = function()
    vim.g.indent_guides_auto_colors = 0
    
    -- Set up autocommands for colors
    vim.api.nvim_create_autocmd({ "VimEnter", "Colorscheme" }, {
      callback = function()
        vim.cmd("hi IndentGuidesOdd  guibg=red   ctermbg=3")
        vim.cmd("hi IndentGuidesEven guibg=green ctermbg=4")
      end,
    })
  end,
}

