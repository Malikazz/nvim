vim.pack.add{
	{src= 'https://github.com/nvim-treesitter/nvim-treesitter'},
}

require('nvim-treesitter').setup({
	ensure_installed = {'bash', 'c', 'css', 'html', 'make', 'cpp', 'diff', 'csv', 
	'dockerfile', 'go', 'gomod', 'gosum', 'helm', 'java', 'php', 'javascript', 'json', 
	'lua', 'markdown', 'nginx', 'python', 'regex', 'scss', 'terraform', 'typescript', 
	'react', 'vue', 'xml', 'yaml'},
})
