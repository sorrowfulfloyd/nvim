return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("transparent").setup({
			-- table: default groups
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- table: additional groups that should be cleared
			extra_groups = {},
			-- table: groups you don't want to clear
			exclude_groups = {},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})
		-- require("transparent").clear_prefix("lualine")
		require("transparent").clear_prefix("NeoTree")
		require("transparent").clear_prefix("Telescope")
		require("transparent").clear_prefix("NvimTree")
		require("transparent").clear_prefix("WhichKey")
		require("transparent").clear_prefix("Outline")
		require("transparent").clear_prefix("LspInfo")
		require("transparent").clear_prefix("LspInstall")
		require("transparent").clear_prefix("Diffview")
		require("transparent").clear_prefix("Mason")
		require("transparent").clear_prefix("Lazy")
		require("transparent").clear_prefix("nvim-lspconfig")
	end,
}
