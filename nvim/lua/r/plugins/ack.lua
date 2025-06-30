-- Ack plugin configuration  
return {
  "mileszs/ack.vim",
  config = function()
    if vim.fn.executable("ag") == 1 then
      vim.g.ackprg = "ag --vimgrep"
    else
      vim.g.ackprg = "ag --nogroup --nocolor --column"
    end
  end,
}

