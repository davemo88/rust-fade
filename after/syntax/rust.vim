
syntax region rsTypeParams matchgroup=rsDelimiter start='<' end='>' keepend contains=TOP

syntax match rsModule '\v(::)@<=[a-z][a-z0-9_]*'
syntax match rsModule '\v[a-z][a-z0-9_]*(::)@='

syntax match rsFieldAccess '\v(\.)@<=[a-z][a-z0-9_]*>(\()@!'

" Foreign items are always preceded by zero or more type names separated by ‘::’
" (think nested enum variants) and at least one module path. This module path is
" preceded by a word separator to prevent matching partially on type names (i.e.
" skipping the instal capital letter).
function! MatchForeign(regex, groupName, extraParams)
    execute 'syntax match ' . a:groupName . ' "\v(<[a-z][a-z0-9_]*::([A-Z][A-Za-z0-9]*::)*)@<=' . a:regex . '"' . a:extraParams
endfunction

" Crate-local items are also preceded by zero or more types names separated by
" ‘::’, which is then preceded by zero or more module names separated by ‘::’,
" which is finally preceded by ‘crate::’.
function! MatchCrateLocal(regex, groupName, extraParams)
    execute 'syntax match ' . a:groupName . ' "\v(crate::([a-z][a-z0-9_]*::)*([A-Z][A-Za-z0-9]*::)*)@<=' . a:regex . '"' . a:extraParams
endfunction

"
" Types
"

syntax match rsUserType '\v<[A-Z][A-Za-z0-9]*' nextgroup=rsTypeParams
call MatchForeign('[A-Z][A-Za-z0-9]*', 'rsForeignType', ' nextgroup=rsTypeParams')
call MatchCrateLocal('[A-Z][A-Za-z0-9]*', 'rsCrateType', ' nextgroup=rsTypeParams')

"
" Constants
"

syntax match rsUserConst '\v<[A-Z][A-Z0-9_]+>'
call MatchForeign('[A-Z][A-Z0-9_]+>', 'rsForeignConst', '')
call MatchCrateLocal('[A-Z][A-Z0-9_]+>', 'rsCrateConst', '')

"
" Functions
"

syntax match rsUserFunc '\v[a-z][a-z0-9_]*(\()@='

call MatchForeign('[a-z][a-z0-9_]*(\()@=', 'rsForeignFunc', '')
call MatchCrateLocal('[a-z][a-z0-9_]*(\()@=', 'rsCrateFunc', '')

syntax match rsUserMethod '\v(\.)@<=[a-z][a-z0-9_]*(\(|::)@='
highlight default link rsUserMethod rsUserFunc

syntax match rsDelimiter '[(){}\[\]|\.,;]\+'

" syn match MyAngleBrace '[<>]'
syntax match rsOperator '[!%&/\*+<=>?\^-]\+'

" We highlight mutable references separately as an operator because otherwise
" they would be recognised as the ‘mut’ keyword, thus whatever comes after the
" ‘mut’ is highlighted as an identifier definition.
syntax match rsOperator '&mut'

" syn match MyParens /[\[\]\(\)\{\}\.]/
" syn match MySemicolons /;/
" syn match MyDoubleColons /::/
" syn keyword rustKeyword as
