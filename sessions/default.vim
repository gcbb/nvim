let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_other
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +26311 serviceComponent.arxml
badd +5 ~/AppData/Local/nvim/init.vim
badd +2 Autosar_MemMap.arxml
badd +1 Autosar_PlatformTypes.arxml
badd +371 AUTOSAR_StdTypes.arxml
badd +228 NVRAMInterfaces.arxml
badd +0 term://D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_other//23312:cmd.exe
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_bsw/SCU_SystemMapping.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_comm_def/SCU_ApplCompuMethodDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_comm_def/SCU_ApplCSInterfaceDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_comm_def/SCU_ApplDataTypeDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_comm_def/SCU_ApplDataTypeMappingDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_comm_def/SCU_ApplImplDataTypeDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_comm_def/SCU_ApplSRInterfaceDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_comm_def/SCU_ApplUnitsDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_composition/SCU_ApplCompositionDefine.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/AC_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/ARB_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/CanIn_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/CanOut_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/CFM_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/LC_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/MC_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SaIn_SWC.arxml
badd +3 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SaOut_SWC.arxml
badd +1 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SF_SWC.arxml
badd +3 D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/VC_SWC.arxml
argglobal
%argdel
$argadd Autosar_MemMap.arxml
$argadd Autosar_PlatformTypes.arxml
$argadd AUTOSAR_StdTypes.arxml
$argadd NVRAMInterfaces.arxml
$argadd serviceComponent.arxml
edit D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SF_SWC.arxml
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
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
exe '1resize ' . ((&lines * 36 + 24) / 49)
exe '2resize ' . ((&lines * 10 + 24) / 49)
argglobal
5argu
if bufexists(fnamemodify("D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SF_SWC.arxml", ":p")) | buffer D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SF_SWC.arxml | else | edit D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SF_SWC.arxml | endif
if &buftype ==# 'terminal'
  silent file D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/SF_SWC.arxml
endif
balt D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_swc/VC_SWC.arxml
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
5argu
if bufexists(fnamemodify("term://D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_other//23312:cmd.exe", ":p")) | buffer term://D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_other//23312:cmd.exe | else | edit term://D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_other//23312:cmd.exe | endif
if &buftype ==# 'terminal'
  silent file term://D:/gcbb/tphelp/arxml/Models/ApplIfDefine/arxml_other//23312:cmd.exe
endif
balt Autosar_MemMap.arxml
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 154 - ((9 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 154
normal! 039|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 36 + 24) / 49)
exe '2resize ' . ((&lines * 10 + 24) / 49)
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
