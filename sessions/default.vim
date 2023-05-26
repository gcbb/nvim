let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/gVim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +38 init.vim
badd +9 lua/lsp/config/json.lua
badd +95 lua/plugins.lua
badd +51 lua/lsp/cmp.lua
badd +29 lua/lsp/setup.lua
badd +1 [packer]
badd +21 lua/lsp/config/yamlls.lua
badd +14 lua/lsp/ui.lua
badd +4 lua/lsp/config/css.lua
badd +32 lua/insis2/lsp/common-config.lua
badd +9 lua/lsp/config/bash.lua
badd +1 lua/lsp/config/emmet.lua
badd +4 lua/lsp/config/html.lua
badd +48 lua/lsp/config/lua.lua
badd +1 lua/lsp/config/markdown.lua
badd +1 lua/lsp/config/pyright.lua
badd +2 lua/lsp/config/rust.lua
badd +7 lua/lsp/config/ts.lua
argglobal
%argdel
$argadd init.vim
edit lua/lsp/config/yamlls.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 120) / 240)
exe 'vert 2resize ' . ((&columns * 208 + 120) / 240)
argglobal
enew
file NERD_tree_1
balt init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
balt lua/lsp/config/ts.lua
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
3
normal! zo
5
normal! zo
10
normal! zo
let s:l = 14 - ((13 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 08|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 120) / 240)
exe 'vert 2resize ' . ((&columns * 208 + 120) / 240)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
