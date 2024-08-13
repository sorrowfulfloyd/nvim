return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			background = {
				dark = "dragon",
			},
		})
		vim.cmd.colorscheme("kanagawa-dragon")
	end,
}
