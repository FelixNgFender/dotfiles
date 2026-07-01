-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = "*.pdf",
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		-- open the PDF
		vim.cmd("silent !open " .. filename)
		-- close the empty buffer created by Neovim for the PDF
		vim.cmd("buffer # | bd! #")
	end,
})

-- Brazil/bemol multi-package workspace support
local function bemol()
	local bemol_dir = vim.fs.find({ ".bemol" }, { upward = true, type = "directory" })[1]
	local ws_folders_lsp = {}
	if bemol_dir then
		local file = io.open(bemol_dir .. "/ws_root_folders", "r")
		if file then
			for line in file:lines() do
				table.insert(ws_folders_lsp, line)
			end
			file:close()
		end
	end

	for _, line in ipairs(ws_folders_lsp) do
		vim.lsp.buf.add_workspace_folder(line)
	end
end

-- Call bemol when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		bemol()
	end,
})
