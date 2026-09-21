vim.pack.add{
	{src="https://github.com/mbbill/undotree"},
}

vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle, { desc = 'Telescope find files' })
