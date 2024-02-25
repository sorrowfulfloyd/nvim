return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        themable = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        separator_style = "slant",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Tree",
            text_align = "left",
            seperator = true,
          }
        },
      }
    }
  end,

  vim.api.nvim_set_keymap('n', 'H', '<CMD>BufferLineCyclePrev<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', 'L', '<CMD>BufferLineCycleNext<CR>', { noremap = true, silent = true })
}
