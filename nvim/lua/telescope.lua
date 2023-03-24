local utils = require('utils')
utils.map('n', '<leader>o<TAB>', '<cmd>Telescope find_files<CR>') -- Clear highlights
utils.map('n', '<leader>g<TAB>', '<cmd>Telescope git_files<CR>') -- Clear highlights
utils.map('n', '<leader>b<TAB>', '<cmd>Telescope buffers<CR>') -- Clear highlights
utils.map('n', '<leader>h<TAB>', '<cmd>Telescope help_tags<CR>') -- Clear highlights

