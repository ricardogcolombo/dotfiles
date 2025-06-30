-- Main init file to load all core configurations
require("r.core.options")
require("r.core.keymaps")
require("r.core.autocmds")
require("r.core.functions")
require("r.core.highlights").setup()

-- Load plugins
require("r.plugins")

