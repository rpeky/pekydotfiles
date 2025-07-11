-- lua/plugins/indent-guides.lua
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",                 -- NEW in v3: entry-point renamed
    opts = {
      indent = { char = "│" },    -- thin bar, feel free to change
      scope  = { enabled = true } -- highlight current indent block
    },
  },
}

