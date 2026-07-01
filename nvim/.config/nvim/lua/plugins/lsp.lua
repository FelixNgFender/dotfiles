return {
	{

		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {
					mason = false,
					autostart = false,
				},
				ruff = {
					keys = {
						{
							"<leader>co",
							function()
								vim.lsp.buf.code_action({
									apply = true,
									context = { only = { "source.organizeImports" }, diagnostics = {} },
								})
							end,
							desc = "Organize Imports",
						},
					},
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"codelldb",
				"hadolint",
				"markdown-toc",
				"markdownlint-cli2",
				"prettier",
				"shellcheck",
				"shfmt",
				"sqlfluff",
				"stylua",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"astro",
				"bashls",
				"clangd",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"jsonls",
				"lua_ls",
				"marksman",
				"ruff",
				"taplo",
				"texlab",
				"tinymist",
				"ts_ls",
				"ty",
				"vtsls",
				"yamlls",
			},
		},
	},
}
