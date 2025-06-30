-- Prettier plugin configuration
return {
  "prettier/vim-prettier",
  build = "yarn install",
  ft = { "javascript", "typescript", "css", "less", "scss", "json", "graphql", "markdown", "vue", "yaml", "html" },
  config = function()
    -- Prettier keybinding is handled in keymaps.lua
  end,
}

