return {
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
		{ "<leader>cp", "<cmd>TypstPreview<CR>", desc = "TypstPreviewToggle" },
	},
}
