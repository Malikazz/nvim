vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

require('nvim-treesitter').install({
  'bash', 'c', 'cpp', 'css', 'csv', 'diff', 'dockerfile',
  'go', 'gomod', 'gosum', 'helm',
  'html', 'html_tags',           -- html_tags needed for html/vue/svelte injections
  'java', 'javascript', 'ecma', 'jsx',
  'json', 'lua', 'make',
  'markdown', 'markdown_inline', -- inline needed for full markdown highlighting
  'nginx', 'php', 'python', 'query', 'regex', 'scss',
  'terraform', 'tsx', 'typescript', 'vue', 'xml', 'yaml',
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('ts_start', { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
    if not lang or not vim.treesitter.language.add(lang) then return end
    vim.treesitter.start(ev.buf, lang)
  end,
})

