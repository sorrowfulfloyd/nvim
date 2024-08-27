return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("todo-comments").setup({
			signs = true, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			-- keywords recognized as todo comments
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
			},
			-- list of named colors where we try to extract the guifg from the
			-- list of highlight groups or use the hex color if hl not found as a fallback
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--glob=!**/node_modules/**", -- Exclude node_modules directory (JavaScript, TypeScript, etc.)
					"--glob=!**/public/**", -- Exclude public directory (JavaScript, etc.)
					"--glob=!**/dist/**", -- Exclude dist directory (JavaScript, etc.)
					"--glob=!**/target/**", -- Exclude target directory (Rust, Java, etc.)
					"--glob=!**/.git/**", -- Exclude .git directory (all Git projects)
					"--glob=!**/build/**", -- Exclude build directory (C, C++, etc.)
					"--glob=!**/vendor/**", -- Exclude vendor directory (PHP, Go, etc.)
					"--glob=!**/__pycache__/**", -- Exclude __pycache__ directory (Python)
					"--glob=!**/.venv/**", -- Exclude .venv directory (Python virtual environments)
					"--glob=!**/.DS_Store/**", -- Exclude .DS_Store files (macOS)
					"--glob=!**/.idea/**", -- Exclude .idea directory (JetBrains IDEs)
					"--glob=!**/.vscode/**", -- Exclude .vscode directory (VSCode)
					"--glob=!**/coverage/**", -- Exclude coverage directory (Testing tools)
					"--glob=!**/.next/**", -- Exclude .next directory (Next.js)
					"--glob=!**/.nuxt/**", -- Exclude .nuxt directory (Nuxt.js)
					"--glob=!**/out/**", -- Exclude out directory (Various JavaScript bundlers)
					"--glob=!**/.serverless/**", -- Exclude .serverless directory (Serverless framework)
					"--glob=!**/logs/**", -- Exclude logs directory (Logs in various projects)
					"--glob=!**/tmp/**", -- Exclude tmp directory (Temporary files in various projects)
					"--glob=!**/.expo/**", -- Exclude .expo directory (Expo React Native)
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		})
		local function find_git_root()
			local git_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
			if vim.v.shell_error == 0 then
				return git_dir
			end
			return nil
		end

		local function todo_telescope_git_root()
			local git_root = find_git_root()
			if git_root then
				require("telescope").extensions["todo-comments"].todo({
					search_dirs = { git_root },
				})
			else
				print("Not inside a Git repository")
			end
		end

		vim.api.nvim_create_user_command("TodoGrepGitRoot", todo_telescope_git_root, {})
		vim.keymap.set("n", "<leader>Tg", ":TodoGrepGitRoot<cr>", { desc = "[T]odo search in [G]it Root" })
	end,

	require("which-key").add({
		{ "<leader>T", group = "[T]odo" },
	}),
	vim.keymap.set("n", "<leader>Te", ":TodoTelescope<CR>", { desc = "Search TODOs in Telescope (Current Directory)" }),
	vim.keymap.set("n", "<leader>Tl", ":TodoLocList<CR>", { desc = "List TODOs in Location List (Current Directory)" }),
	vim.keymap.set(
		"n",
		"<leader>Tq",
		":TodoQuickFix<CR>",
		{ desc = "Search TODOs in Quickfix Tab (Current Directory)" }
	),
	vim.keymap.set("n", "<leader>Tg", ":TodoGrepGitRoot<CR>", { desc = "[T]odo search in [G]it Root" }),

	--[[ vim.api.nvim_set_keymap('n', '<leader>Te', ':TodoTelescope<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>Tl', ':TodoLocList<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>Tq', ':TodoQuickfix<CR>', { noremap = true, silent = true }) ]]
}
