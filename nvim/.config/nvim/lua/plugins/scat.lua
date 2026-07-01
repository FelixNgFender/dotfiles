return {
	{
		url = "ssh://git.amazon.com/pkg/Scat-nvim",
		branch = "mainline",
		dependencies = { "nvim-telescope/telescope.nvim", "sindrets/diffview.nvim", "folke/which-key.nvim" },
		config = function()
			local brazil = require("scat.brazil")
			local brazil_utils = require("scat.brazil.utils")
			local cr = require("scat.cr")
			local local_manager = require("scat.cr.local_manager")
			local paste = require("scat.paste")
			local tiny_url = require("scat.tiny")
			local scat_ui = require("scat.ui")

			require("scat").setup({
				cr = {
					template_path = nil,
					template_content = [[
  ## Overview
  [description]: # what is the purpose of this change, how does it affect anything?

  ## Testing
  `brazil-build`
  ]],
					user = vim.fn.expandcmd("$USER"),
				},
				brazil_workplace_path = vim.fn.expandcmd("$HOME/workplace"),
			})

			require("which-key").add({
				{ "<leader>m", group = "aMz", icon = "" },

				{ "<leader>mb", group = "Brazil" },
				{ "<leader>mbb", brazil.build_current_package, desc = "Build Package" },
				{ "<leader>mbr", brazil.build_current_package_recursively, desc = "Build Recursively" },
				{
					"<leader>mbc",
					brazil.run_command_inside_current_package,
					desc = "Run Command in Package",
				},
				{
					"<leader>mbt",
					function()
						brazil.pick_brazil_task_inside_current_package({
							callback = function(task)
								vim.g.test_replacement_command = task
							end,
						})
					end,
					desc = "Pick Task in Package",
				},
				{ "<leader>mbl", brazil.run_prev_brazil_task, desc = "Run Last Task" },
				{ "<leader>mbs", brazil_utils.run_checkstyle, desc = "Run Checkstyle" },

				{ "<leader>mw", group = "Workspace" },
				{ "<leader>mws", brazil.switch_workspace_package_info, desc = "Switch packageInfo" },
				{ "<leader>mwi", brazil.install_current_jdt_package, desc = "Install JDT Package" },
				{ "<leader>mwl", brazil.list_all_packages, desc = "List Packages" },
				{ "<leader>mwL", brazil.lookup_packages, desc = "Lookup Packages" },

				{ "<leader>mr", group = "CRUX" },
				{ "<leader>mrc", cr.open_cr, desc = "Create CR" },
				{ "<leader>mru", cr.update_existing_cr, desc = "Update Existing CR" },
				{ "<leader>mrf", cr.fetch_active_crs, desc = "Fetch Active CRs" },
				{
					"<leader>mrF",
					function()
						cr.fetch_active_crs({ force_pick = true })
					end,
					desc = "Fetch Active CRs (force pick)",
				},
				{ "<leader>mrt", local_manager.toggle_cr_overview, desc = "Toggle CR Overview" },

				{ "<leader>mu", group = "URLs" },
				{ "<leader>mup", brazil.display_current_package_url, desc = "Package URL" },
				{ "<leader>muP", brazil.display_package_under_cursor_url, desc = "Package under Cursor URL" },
				{ "<leader>mur", brazil.display_release_under_cursor_url, desc = "Release under Cursor URL" },
				{ "<leader>muf", brazil.display_current_file_url, mode = { "n", "x" }, desc = "File URL" },
				{ "<leader>muv", brazil.display_current_version_set_url, desc = "Version Set URL" },
				{ "<leader>mus", tiny_url.shorten_url, desc = "Shorten URL" },

				{ "<leader>mp", group = "Paste" },
				{ "<leader>mps", paste.send_to_pastebin, mode = { "n", "x" }, desc = "Send to Pastebin" },
				{ "<leader>mpl", paste.list_my_pastes, desc = "List My Pastes" },

				{
					"<leader>ma",
					function()
						scat_ui.display_dropdown_with_actions("All actions", {
							{
								label = "Midway",
								action = function()
									brazil.run_command_inside_current_package("mwinit -w")
								end,
							},
							{ label = "Tiny Url", action = tiny_url.shorten_url },
							{
								label = "Sync version set",
								action = function()
									brazil.run_command_inside_current_package("brazil workspace sync --md")
								end,
							},
							{ label = "Lookup version set", action = brazil.lookup_version_set },
							{ label = "Lookup package", action = brazil.lookup_packages },
							{
								label = "Display current version set url",
								action = brazil.display_current_version_set_url,
							},
							{ label = "List all packages", action = brazil.list_all_packages },
							{ label = "Switch workspace package info", action = brazil.switch_workspace_package_info },
							{ label = "Look up and install package", action = brazil.lookup_packages },
							{ label = "Look up and use version set", action = brazil.lookup_version_set },
							{ label = "Open Paste", action = paste.open_paste_directly },
						}, nil)
					end,
					desc = "Actions Dropdown",
				},
			})
		end,
	},
}
