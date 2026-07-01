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
				barium = {},
			},
			setup = {
				barium = function()
					local configs = require("lspconfig.configs")

					vim.filetype.add({
						filename = {
							["Config"] = function()
								vim.b.brazil_package_Config = 1
								return "brazil-config"
							end,
						},
					})

					configs.barium = {
						default_config = {
							cmd = { "barium" },
							filetypes = { "brazil-config" },
							root_dir = function(fname)
								return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
							end,
							settings = {},
						},
					}
				end,
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
				"jdtls",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				"ruff",
				"taplo",
				"texlab",
				"tinymist",
				"ts_ls",
				"ty",
				"vtsls",
				"yamlls",
			},
			automatic_enable = {
				-- We will enable jdtls ourselves in attach_jdtls()
				exclude = { "jdtls" },
			},
		},
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			local attach_jdtls = function()
				local default_config = require("lspconfig.configs.jdtls").default_config
				local cmd = default_config.cmd

				-- lombok support
				local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
				if vim.uv.fs_stat(lombok_jar) then
					table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
				end

				-- setup bemol workspaces
				local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")
				if root_dir then
					local ws_file = io.open(root_dir .. "/.bemol/ws_root_folders")
					if ws_file then
						for line in ws_file:lines() do
							vim.lsp.buf.add_workspace_folder(line)
						end
						ws_file:close()
					end
				end

				-- keymaps
				vim.keymap.set("n", "<leader>co", require("jdtls").organize_imports, { desc = "Organize Imports" })

				require("jdtls").start_or_attach({
					cmd = cmd,
					root_dir = root_dir,
				})
			end

			vim.api.nvim_create_autocmd("Filetype", {
				pattern = "java",
				callback = attach_jdtls,
			})

			attach_jdtls()
		end,
	},
}
