local plugins_ret =  require('plugins')
local completions_ret =  require('completions')

vim.cmd[[colorscheme tokyonight]]

-- Status bar
require'lsp-progress'.setup{}
require("lualine").setup({
  sections = {
    lualine_c = {
      function()
        return require('lsp-progress').progress()
      end,
    },
  }
})
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})

-- LSP settings. Must be called on_attach for each language server.
local lspconfig = require'lspconfig'
local completion_capabilities = require('cmp_nvim_lsp').default_capabilities()
function lsp_keymap(bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }

	-- Navigation
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

	-- Information
	vim.keymap.set('n', 'gk', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

	-- Diagnostics
	vim.keymap.set('n', 'ge', vim.diagnostic.open_float, bufopts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)

	-- Actions
	vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<leader>S', vim.lsp.buf.workspace_symbol, bufopts) -- global search

	-- Workspace management
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wl', function()
	  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
end

lspconfig.rust_analyzer.setup({
    on_attach = function(client, bufnr)
        lsp_keymap(bufnr)
    end,
    capabilities = completion_capabilities,
})
require'lspconfig'.pyright.setup({
    on_attach = function(client, bufnr)
        lsp_keymap(bufnr)
    end,
    capabilities = completion_capabilities,
})

-- Tab settings
vim.opt.tabstop = 4      -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.softtabstop = 4  -- Number of spaces that a <Tab> counts for during editing operations

-- Misc
vim.o.clipboard = 'unnamedplus'  -- Use the system clipboard
vim.wo.number = true
vim.wo.colorcolumn = '100'
