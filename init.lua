## Pauls custom nvim
require("config.options")
require("config.keymaps")

require("plugins.oil")
require("plugins.lspconfig")
require("plugins.bufferline")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.git-fugitive")
require("plugins.colorschme")
require("plugins.blink")
require("plugins.undotree")
require("plugins.todo")
require("lsp.typescript-tools")

require("auto_commands.telescope")

vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("typescript-tools")
