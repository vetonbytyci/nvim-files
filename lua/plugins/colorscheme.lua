return {
  "craftzdog/solarized-osaka.nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      transparent = true,
      terminal_color = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    }
  end,
}
