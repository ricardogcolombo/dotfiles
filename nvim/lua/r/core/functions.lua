-- Custom functions converted from old.vim
local M = {}

-- LightlineFilename function
function M.lightline_filename()
  local filename_only = vim.fn.expand('%:t:r')
  if filename_only:lower() == "index" then
    local parts = vim.split(vim.fn.expand("%:h"), "/")
    local parent = parts[#parts] or ""
    return parent .. "/" .. vim.fn.expand("%:t")
  else
    return vim.fn.expand("%:t")
  end
end

-- Global function for lightline
_G.LightlineFilename = M.lightline_filename

return M

