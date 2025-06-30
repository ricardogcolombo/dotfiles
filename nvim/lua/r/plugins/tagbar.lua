-- Tagbar plugin configuration
return {
  "preservim/tagbar",
  cmd = "TagbarToggle",
  config = function()
    vim.g.vim_tags_auto_generate = 1
  end,
}

