return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		indent = { animate = { enabled = false } },
		scroll = { enabled = false },
		image = {},
		terminal = { win = { position = "float" } },
		picker = {
			sources = {
				explorer = {
					layout = { preset = "sidebar", layout = { position = "right" } },
				},
			},
		},
		layout = {
			sidebar = { position = "right" },
		},
	},
}
