return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- Basic telescope setup for plugins that need it (ChatGPT, Avante)
    require("telescope").setup({
      defaults = {
        -- Basic configuration
        file_ignore_patterns = { "node_modules", ".git" },
      },
    })
  end,
}

