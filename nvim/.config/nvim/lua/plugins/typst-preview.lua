return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "typst" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tinymist = {
					single_file_support = true, -- Fixes LSP attachment in non-Git directories
					settings = {
						formatterMode = "typstyle",
						exportPdf = "onSave",
					},
					lint = {
						enabled = true,
					},
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				typst = { "typstyle", lsp_format = "prefer" },
			},
		},
	},
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		opts = {
			dependencies_bin = {
				["tinymist"] = "tinymist",
				["websocat"] = "websocat",
			},
			open_cmd = "firefox %s",
		}, -- lazy.nvim will implicitly calls `setup {}`
		keys = {
			{ "<leader>cp", ft = "typst", "<cmd>TypstPreviewToggle<CR>", desc = "Toggle Typst Preview" },
		},
	},
	{
		"folke/ts-comments.nvim",
		opts = {
			lang = {
				typst = { "// %s", "/* %s */" },
			},
		},
	},
}
