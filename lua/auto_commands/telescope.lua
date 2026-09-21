-- Run `make` whenever telescope-fzf-native is installed or updated
local fzf native_dir = vim.fn.stdpath("data")
  .. "/pack/nvim/start/telescope-fzf-native.nvim"

vim.api.nvim_create_autocmd("PackChanged", {
  pattern = "telescope-fzf-native.nvim",
  callback = function()
    -- cd into the plugin root and run make
    vim.cmd("cd " .. vim.fn.fnameescape(fzf_native_dir))
    vim.fn.system({ "make" })
    vim.cmd("cd -")
  end,
})
