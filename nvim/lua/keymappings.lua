local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape

utils.map('n', '<C-h>', '<cmd><C-w>h<CR>') -- Clear highlights
utils.map('n', '<C-j>', '<cmd><C-w>j<CR>') -- Clear highlights
utils.map('n', '<C-k>', '<cmd><C-w>k<CR>') -- Clear highlights
utils.map('n', '<C-l>', '<cmd><C-w>l<CR>') -- Clear highlights


