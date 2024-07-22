local plugins_ret =  require('plugins')

vim.cmd[[colorscheme tokyonight]]

require'lualine'.setup{
	sections = {
		lualine_lsp = {
			function()
				return require('lsp-progress').progress()
			end,
		},
	}
}
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})

require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}

local lspconfig = require'lspconfig'
--[[
function lsp_keymap(bufnr)
	print("LSP started.")
	-- require'completion'.on_attach(client)
	-- require'diagnostic'.on_attach(client)
	--

	local bufopts = { noremap=true, silent=true, buffer=bufnr }

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n','gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n','K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n','gr', vim.lsp.buf.references, bufopts)

	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end
--]]

    --[[
lspconfig.rust_analyzer.setup({
    on_attach = function(client, bufnr)
	    lsp_keymap(bufnr)
    end
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
    --]]

vim.o.clipboard = 'unnamedplus'  -- Use the system clipboard
vim.wo.number = true
