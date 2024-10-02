return {
	"nvim-lualine/lualine.nvim",
	opts = function()
		-- Use the "auto" theme as the base
		local lualine_theme = require("lualine.themes.auto")

		-- Make the background of all theme components transparent
		for _, mode in pairs(lualine_theme) do
			for _, section in pairs(mode) do
				section.bg = "none"
			end
		end

		return {
			options = {
				icons_enabled = true,
				theme = lualine_theme, -- Apply the modified theme
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		}
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
