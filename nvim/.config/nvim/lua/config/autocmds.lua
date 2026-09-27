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
