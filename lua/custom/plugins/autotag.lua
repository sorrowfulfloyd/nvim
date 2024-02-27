return {
  'windwp/nvim-ts-autotag',

  setup = function()
    require('nvim-ts-autotag').setup(
      {
        autotag = {
          enable = true
        }
      }
    )
  end

}
