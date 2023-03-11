vim.opt.encoding = "utf-8"

vim.opt.nobackup = true
vim.opt.nowritebackup = true

vim.opt.updatetime = 300
vim.opt.signcolumn = true

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true
vim.opt.autoindent = true

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ttyfast = true

vim.opt.syntax = "on"
vim.opt.cursorline = true


function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap("<F8>", ":TagbarToggle<CR>")
