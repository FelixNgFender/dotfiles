return {
	"jalvesaq/zotcite",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("zotcite").setup({
			open_in_zotero = true,
			zotero_sqlite_path = string.format("%s/zotero.sqlite", os.getenv("ZOTERO_PATH")),
			-- Can also set a different value for each document, just add the key
			-- `zotcite-key-type` to the YAML header. for markdown use `better-bibtex`
			-- for typst use `template`
			key_type = "better-bibtex",
			-- Separator for citations
			year_page_sep = ", p. ",
		})
	end,
}
