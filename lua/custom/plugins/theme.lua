-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			background = {
-- 				dark = "dragon",
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("kanagawa-dragon")
-- 	end,
-- }

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
-- return {
-- 	"Mofiqul/vscode.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("vscode").setup({
-- 			italic_comments = true,
-- 			disable_nvimtree_bg = true,
-- 		})
-- 		vim.cmd.colorscheme("vscode")
-- 	end,
-- }
--

return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("rose-pine")
	end,
}

-- return {
-- 	"slugbyte/lackluster.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	init = function()
-- 		-- vim.cmd.colorscheme("lackluster")
-- 		vim.cmd.colorscheme("lackluster-hack") -- my favorite
-- 		-- vim.cmd.colorscheme("lackluster-mint")
-- 	end,
-- }
