-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set({ "n", "t" }, "<C-/>", function()
	require("snacks").terminal.toggle(nil, { interactive = true, win = { position = "float" } })
end, { noremap = true, silent = true, desc = "Open Floating Terminal" })
vim.keymap.set("n", "<leader>zr", ":Zseek<CR>", { desc = "Zotcite: search references" })
vim.keymap.set("n", "<leader>zn", ":Zselectannotations<CR>", { desc = "Zotcite: search notes/annotations" })
vim.keymap.set(
	"n",
	"<Leader>zp",
	":!pandoc '%:p' -o '%:p:r.html' --citeproc --bibliography=\"$ZOTERO_BIB\"<CR>",
	{ silent = true, desc = "Pandoc: compile to html" }
)
