return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	after = "catppuccin",
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				mode = "tabs",
				-- separator_style = "slant",
			},
		})
		-- disabling it for now
		--
		vim.opt.showtabline = 0
	end,
}
