--[[ return {
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
} ]]

-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nightfox").setup({
-- 			-- background = {
-- 			-- 	dark = "carbonfox",
-- 			-- },
-- 		})
-- 		vim.cmd.colorscheme("carbonfox")
-- 	end,
-- }
--
return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vscode").setup({
			italic_comments = true,
			disable_nvimtree_bg = true,
		})
		vim.cmd.colorscheme("vscode")
	end,
}
