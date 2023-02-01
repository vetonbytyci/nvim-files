local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'none',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    tab = {
      fg = '#657b83',
      bg = '#ffffff',
    },
    separator = {
      fg = '#657b83',
      bg = '#000000',
    },
    separator_selected = {
      fg = '#073642',
      bg = '#000000',
    },
    background = {
      fg = '#657b83',
      bg = '#000000',
      opacity = 0.5,
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
      bg = '#000000',
    },
    buffer_visible = {
      bg = '#000000',
      fg = '#fdf6e3',
    },
    fill = {
      bg = '#000000',
      opacity = 0.5,
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
