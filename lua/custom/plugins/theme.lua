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
		-- require("rose-pine").setup({
		-- 	disable_background = true,
		-- })
		--
		vim.cmd.colorscheme("rose-pine")
		--
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
	end,
}
