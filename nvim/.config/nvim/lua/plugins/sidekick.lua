return {
	"folke/sidekick.nvim",
	opts = {
		cli = {
			tools = {
				codex = {
					cmd = { "codex", "--aws-profile", "astra" },
				},
			},
		},
	},
}
