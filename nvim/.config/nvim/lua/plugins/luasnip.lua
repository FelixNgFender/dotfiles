return {
	"L3MON4D3/LuaSnip",
	opts = function(_, opts)
		-- extend the default opts from LazyVim
		opts.history = true
		opts.delete_check_events = "TextChanged"
	end,
	config = function()
		-- Add custom snippets
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node

		ls.add_snippets("all", {
			s("lorem", {
				t({
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
					"Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
					"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
					"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
					"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
				}),
			}),
		})

		-- you can add other filetype specific snippets here as well
		-- ls.add_snippets("lua", { ... })
	end,
}
