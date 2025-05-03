return {
	"ldelossa/nvim-dap-projects",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("nvim-dap-projects").search_project_config()
	end,
	event = "VeryLazy",
}
