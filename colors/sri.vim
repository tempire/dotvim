set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sri"

hi Visual guibg=#404040
hi Cursor guibg=#b0d0f0

hi Normal guifg=#fffedc guibg=#1a1a1a
"hi Normal guifg=#fffedc guibg=#1a1a1a
"hi Normal guifg=#ffffff guibg=#111111
hi Underlined guifg=#fffedc guibg=NONE gui=underline
hi NonText guifg=#34383c guibg=NONE
hi SpecialKey guifg=#303030 guibg=NONE
hi LineNr guifg=#34383c guibg=NONE gui=NONE
hi StatusLine guifg=black guibg=#666666 gui=NONE
hi StatusLineNC guifg=#666666 guibg=#333333 gui=NONE
"hi StatusLineNC guifg=#34383c guibg=#333333 gui=NONE
hi VertSplit guifg=#303030 guibg=#303030 gui=NONE
hi WildMenu guifg=#fffedc guibg=NONE gui=NONE
hi Folded guifg=#8a9597 guibg=#34383c gui=NONE
hi FoldColumn guifg=#8a9597 guibg=#34383c gui=NONE
hi SignColumn guifg=#8a9597 guibg=#34383c gui=NONE
hi MatchParen guifg=NONE guibg=#a2a96f gui=bold
hi ErrorMsg guifg=#fffedc guibg=NONE gui=NONE
hi WarnMsg guifg=#fffedc guibg=NONE gui=NONE
hi ModeMsg guifg=#fffedc guibg=NONE gui=NONE
hi MoreMsg guifg=#fffedc guibg=NONE gui=NONE
hi Question guifg=#fffedc guibg=NONE gui=NONE

hi Comment guifg=#5F5A60 gui=italic
hi String guifg=#a2a96f
hi Number guifg=#a2a96f

hi Keyword guifg=#ceb67f
hi PreProc guifg=#5F5A60 gui=italic
hi Conditional guifg=#ceb67f
hi Operator guifg=#ceb67f
hi Todo guifg=#8a9597 gui=italic,bold
"hi Constant guifg=#d08356
hi Constant guifg=#d08356

"hi Identifier guifg=#8a9597
hi Identifier guifg=#7283A1
hi Function guifg=#d08356
hi Type guifg=#e3d796 gui=bold
hi Statement guifg=#ceb67f

hi Special guifg=#c2c98f
hi Delimiter guifg=#fffedc
"hi Operator guifg=#fffff

hi Title guifg=#d08356 gui=underline
hi Repeat guifg=#ceb67f
hi Structure guifg=#ceb67f

hi Directory guifg=#dad085
hi Error guibg=#602020

"More by glen
"hi CursorLine guibg=#121212 gui=underline
hi CursorLine guifg=NONE guibg=#000000 gui=none
hi CursorColumn guifg=NONE guibg=#000000 gui=none
hi Pmenu guifg=#f6f3e8 guibg=gray30
hi PmenuSel guifg=#000000 guibg=#cae682
