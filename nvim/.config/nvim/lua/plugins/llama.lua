return {
	"ggml-org/llama.vim",
	init = function()
		vim.g.llama_config = {
			show_info = false,
			endpoint_fim = "http://localhost:8989/infill",
		}
		vim.keymap.set(
			"n",
			"<leader>aT",
			":silent LlamaToggleAutoFim<CR>",
			{ noremap = true, silent = true, desc = "Toggle Auto FIM" }
		)
	end,
}
