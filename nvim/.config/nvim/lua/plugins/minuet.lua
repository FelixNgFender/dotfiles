return {
	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			require("minuet").setup({
				blink = {
					enable_auto_complete = true,
				},
				provider = "openai_fim_compatible",
				n_completions = 1, -- recommend for local model for resource saving
				-- I recommend beginning with a small context window size and incrementally
				-- expanding it, depending on your local computing power. A context window
				-- of 512, serves as an good starting point to estimate your computing
				-- power. Once you have a reliable estimate of your local computing power,
				-- you should adjust the context window to a larger value.
				context_window = 4096,
				throttle = 400,
				debounce = 50,
				-- Request timeout in seconds (blink's timeout_ms should be set to this * 1000)
				request_timeout = 3,
				provider_options = {
					openai_fim_compatible = {
						api_key = "TERM",
						name = "Llama.cpp",
						end_point = "http://localhost:12434/engines/v1/completions",
						-- The model is set by the llama-cpp server and cannot be altered
						-- post-launch.
						model = "huggingface.co/unsloth/Qwen2.5-Coder-3B-Instruct-128K-GGUF:Q4_K_M",
						optional = {
							max_tokens = 224,
							top_p = 0.9,
						},
						-- Llama.cpp does not support the `suffix` option in FIM completion.
						-- Therefore, we must disable it and manually populate the special
						-- tokens required for FIM completion.
						template = {
							prompt = function(context_before_cursor, context_after_cursor, _)
								return "<|fim_prefix|>"
									.. context_before_cursor
									.. "<|fim_suffix|>"
									.. context_after_cursor
									.. "<|fim_middle|>"
							end,
							suffix = false,
						},
					},
				},
			})
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"saghen/blink.cmp",
		optional = true,
		opts = {
			keymap = {
				["<A-y>"] = {
					function(cmp)
						cmp.show({ providers = { "minuet" } })
					end,
				},
			},
			sources = {
				-- Enable minuet for autocomplete
				default = { "minuet" },
				providers = {
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						async = true,
						-- Should match minuet.config.request_timeout * 1000,
						-- since minuet.config.request_timeout is in seconds
						timeout_ms = 3000,
						score_offset = 100,
					},
				},
			},
			-- Recommended to avoid unnecessary request
			completion = { trigger = { prefetch_on_insert = false } },
		},
	},
}
