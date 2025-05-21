return {
  "folke/snacks.nvim",
  opts = {
    indent = { animate = { enabled = false } },
    image = {},
    -- scroll = { enabled = false },
    explorer = {},
    picker = {
      sources = {
        explorer = {
          layout = { preset = "sidebar", preview = false, layout = { position = "right" } },
        },
      },
    },
    layout = {
      sidebar = { position = "right" },
    },
  },
}
