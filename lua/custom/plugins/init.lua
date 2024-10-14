-- My custom settings
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.autochdir = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- autoformat on :w
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   buffer = buffer,
--   callback = function()
--     vim.lsp.buf.format { async = false }
--   end
-- })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
	-- Use the current buffer's path as the starting point for the git search
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir
	local cwd = vim.fn.getcwd()
	-- If the buffer is not associated with a file, return nil
	if current_file == "" then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ":h")
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		print("Not a git repository. Searching on current working directory")
		return cwd
	end
	return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
	local git_root = find_git_root()
	if git_root then
		require("telescope.builtin").live_grep({
			search_dirs = { git_root },
			additional_args = function(opts)
				return {
					"--glob=!.git/",
					"--glob=!.next/",
					"--glob=!node_modules/",
					"--glob=!dist/",
					"--glob=!build/",
					"--glob=!public/",
					"--glob=!coverage/",
					"--glob=!vendor/",
					"--glob=!target/",
					"--glob=!__pycache__/",
					"--glob=!*.lock",
				}
			end,
		})
	end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

local function telescope_live_grep_open_files()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end

vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Git [F]iles" })
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Git [S]tatus" })
vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits, { desc = "Git [C]ommits" })
vim.keymap.set("n", "<leader>gb", require("telescope.builtin").git_branches, { desc = "Git [B]ranches" })
vim.keymap.set(
	"n",
	"<leader>gC",
	require("telescope.builtin").git_bcommits,
	{ desc = "Git [C]ommits (for current buffer)" }
)
vim.keymap.set("n", "<leader>gh", require("telescope.builtin").git_stash, { desc = "Git Stas[h]" })
vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })

vim.opt.termguicolors = true

-- my custom whichkey keymaps
--[[ require('which-key').register {
  ['<leader>x'] = { name = 'E[x]plorer', _ = 'which_key_ignore' },
} ]]
vim.filetype.add({ extension = { templ = "templ" } })
return {}
