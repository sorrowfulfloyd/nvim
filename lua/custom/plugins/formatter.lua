return {
  'mhartington/formatter.nvim',
  config = function()
    require('formatter').setup({
      filetype = {
        lua = { require('formatter.filetypes.lua').stylua },
        python = { require('formatter.filetypes.python').black },
        typescript = { require('formatter.filetypes.typescript').prettier },
        typescriptreact = { require('formatter.filetypes.typescriptreact').prettier },
        javascript = { require('formatter.filetypes.javascript').prettier },
        javascriptreact = { require('formatter.filetypes.javascriptreact').prettier },
        ["*"] = { require('formatter.filetypes.any').remove_trailing_whitespace },
      },
    })
  end,
}
