local status, n = pcall(require, 'neosolarized')
if (not status) then return end

n.setup({ comment_italics = true })

local colorbuddy = require('colorbuddy.init')
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new('black', '#000000')
Color.new('darkGrey', '#3a3b3c')
Group.new('CursorLine', colors.none, colors.darkGrey, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.blue, colors.none, styles.none, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cHint = groups.Hint.fg
local cWarn = groups.Warning.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
Group.new("StatusLine", colors.red, colors.red, styles.NONE)
Group.new("StatusLineNC", colors.red, colors.red, styles.NONE)
Group.new("TelescopeResultsDiffChange", colors.green, colors.none, styles.NONE)
Group.new("TelescopeResultsDiffAdd", colors.green, colors.none, styles.NONE)
