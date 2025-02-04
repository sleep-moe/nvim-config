vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-z>", ":q!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-z>", "<Esc>:q!<CR>", { noremap = true, silent = true })

keymap("n", "<C-g>", ":help<CR>", opts)
keymap("n", "<C-o>", ":w<CR>", opts)
keymap("i", "<C-o>", "<Esc>:w<CR>a", opts)
keymap("n", "<C-r>", ":e!<CR>", opts)
keymap("i", "<C-r>", "<Esc>:e!<CR>a", opts)
keymap("n", "<C-y>", "<C-u>", opts)
keymap("n", "<C-v>", "<C-d>", opts)
keymap("n", "<C-k>", "dd", opts)
keymap("n", "<C-u>", "p", opts)
keymap("n", "<C-c>", ":echo 'Cursor Pos: ' . line('.') . ',' . col('.')<CR>", opts)
keymap("n", "<C-x>", ":q<CR>", opts)
keymap("i", "<C-x>", "<Esc>:q<CR>", opts)
keymap("n", "<C-j>", "gqap", opts)
keymap("n", "<C-w>", ":grep ", opts)
keymap("n", "<C-t>", ":set spell!<CR>", opts)

vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.statusline = "^O Write  ^R Reload  ^Y Prev Pg ^V Next Pg  ^K Cut  ^X Exit  ^W Search"

function ModeLine()
  local mode = vim.api.nvim_get_mode().mode
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    c = "COMMAND",
    R = "REPLACE"
  }
  return "%#PmenuSel# MODE: " .. (modes[mode] or mode)
end

vim.opt.winbar = "%!v:lua.ModeLine()"

require("config.lazy")
require("lazy").setup("plugins")