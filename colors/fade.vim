" Vim color file
" :so $VIMRUNTIME/syntax/hitest.vim to see all active groups


set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "fade"

hi Cursor ctermfg=235 ctermbg=231 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi IncSearch term=reverse cterm=reverse ctermfg=193 ctermbg=16 gui=reverse guifg=#C4BE89 guibg=#000000
hi Search term=reverse cterm=NONE ctermfg=231 ctermbg=24 gui=NONE guifg=#f8f8f2 guibg=#204a87
hi Folded ctermfg=242 ctermbg=235 cterm=NONE guifg=#75715e guibg=#272822 gui=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi SpecialComment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE
hi Normal ctermfg=188 ctermbg=235 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Boolean ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Number ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Float ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0797 guibg=NONE gui=NONE

hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold guifg=#75715e guibg=NONE gui=inverse,bold
hi SignColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
" hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
" hi NonText ctermfg=59 ctermbg=236 cterm=NONE guifg=#49483e guibg=#31322c gui=NONE
" hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE guifg=#49483e guibg=#3c3d37 gui=NONE
" hi Define ctermfg=197 ctermbg=NONE cterm=NONE 
" hi Tag ctermfg=197 ctermbg=NONE cterm=NONE 
" hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

hi Error ctermfg=NONE ctermbg=064

hi SpellBad ctermfg=NONE ctermbg=064
hi YcmErrorSign ctermfg=NONE ctermbg=064 cterm=italic
hi SpellCap ctermfg=NONE ctermbg=235
hi YcmWarningSign ctermfg=064 ctermbg=237 cterm=italic
hi Function ctermfg=176 ctermbg=NONE cterm=NONE
hi Keyword ctermfg=227 ctermbg=NONE cterm=NONE 
hi MatchParen ctermfg=077 ctermbg=NONE cterm=underline 
" things like & and mut
hi StorageClass ctermfg=079 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi Conditional ctermfg=227 ctermbg=NONE cterm=NONE 
hi Statement ctermfg=079 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi PreProc ctermfg=176 ctermbg=NONE cterm=NONE 
hi Type ctermfg=176 ctermbg=NONE cterm=NONE
hi Identifier ctermfg=176 ctermbg=NONE cterm=NONE 
hi String ctermfg=077 ctermbg=NONE cterm=NONE
" mostly the :: between rust namespaces
hi Special ctermfg=061 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE

"NERDTree
hi NERDTreeDirSlash ctermfg=141

" rust
hi rustAssert ctermfg=227
hi rustAttribute ctermfg=061
hi rustFuncCall ctermfg=188 
hi rustDerive ctermfg=061
hi rustDeriveTrait ctermfg=061
hi rustEnumVariant ctermfg=176
hi rustConstant ctermfg=064
hi rustMacro ctermfg=227
hi rustPanic ctermfg=160
hi rustSelf ctermfg=227
hi rustSigil ctermfg=079 
hi rustStorage ctermfg=227 
hi rustSuper ctermfg=176

" don't forget to link after/ in ~/.vim/
hi MyParens ctermfg=187
" hi MyDoubleColons ctermfg=061
hi MySemicolons ctermfg=187
hi MyAngleBrace ctermfg=079
hi rsDelimiter ctermfg=187
" hi rsModule ctermfg=187
hi rsUserType ctermfg=176
hi rsForeignType ctermfg=176
hi rsCrateType ctermfg=176
hi rsUserConst ctermfg=077
hi rsOperator ctermfg=079 ctermbg=NONE cterm=NONE 
