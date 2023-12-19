return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.map('n', '<leader>o<TAB>', '<cmd>Telescope find_files<CR>') 
    keymap.map('n', '<leader>g<TAB>', '<cmd>Telescope git_files<CR>') 
    keymap.map('n', '<leader>b<TAB>', '<cmd>Telescope buffers<CR>') 
    keymap.map('n', '<leader>h<TAB>', '<cmd>Telescope help_tags<CR>') 

  end,
}
