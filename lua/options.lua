--  ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
--  ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.background = "light"

vim.opt.swapfile = false
vim.opt.nu = true
vim.opt.termguicolors = true
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.signcolumn = "no"
vim.opt.laststatus = 0
vim.opt.conceallevel = 3

-- remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

function ToggleSignAndNumber()
    -- sort of a "ternary" operator in lua
    vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
    vim.o.relativenumber = not vim.o.relativenumber
end

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', 'ts', ':lua ToggleSignAndNumber()<CR>', default_opts)
