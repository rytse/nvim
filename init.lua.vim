lua <<EOF

-------------------------------------
-- New commands for using nvim-dap --
-------------------------------------

vim.api.nvim_create_user_command('DDebugInit', function()
    require("dapui").setup()
    require("dapui").open()
    require("dap").repl.open()
    require("dap").continue()
end, {})

vim.api.nvim_create_user_command('DDebugToggle', function()
    require("dapui").toggle()
end, {})

vim.api.nvim_create_user_command('DDebugClose', function()
    require("dapui").close()
    require("dap").repl.close()
end, {})

-- GDB b
vim.api.nvim_create_user_command('DDebugBreakpoint', function()
    require("dap").toggle_breakpoint()
end, {})

-- GDB d
vim.api.nvim_create_user_command('DDebugDelete', function()
end, {})

-- GDB r
vim.api.nvim_create_user_command('DDebugRun', function()
end, {})

-- GDB c
vim.api.nvim_create_user_command('DDebugContinue', function()
    require("dap").continue()
end, {})

-- GDB f
vim.api.nvim_create_user_command('DDebugFinish', function()
end, {})

-- GDB s
vim.api.nvim_create_user_command('DDebugStep', function()
    require("dap").step_into()
end, {})

-- GDB n
vim.api.nvim_create_user_command('DDebugNext', function()
    require("dap").step_over()
end, {})

EOF

