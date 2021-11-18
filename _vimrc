"set fileencoding=utf-8
set encoding=utf-8
set nocompatible
syntax on
filetype off
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
"set nobackup
"set nowritebackup

"set cmdheight = 2
set updatetime=100
set shortmess+=c
set termguicolors

let mapleader = ","
"let g:ctrlp_map = '<leader>p'
"
let bundle_dir = 'd:/sw/vim/bundles/'
set rtp+='D:/sw/vim/vimfiles/'
let g:python3_host_prog = 'C:/Program Files/Python37/python.exe'
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"call plug#begin('C:/Users/Administrator/AppData/Local/nvim/plugged')
call plug#begin(bundle_dir)
     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
     Plug 'junegunn/fzf.vim'
        nnoremap <c-f> :FZF<CR>
        nmap <C-p> :Files<CR>
        nmap <C-e> :Buffers<CR>
        let g:fzf_action = { 'ctrl-e': 'edit' }
    "plug 'ctrlpvim/ctrlp.vim'
        "let g:ctrlp_map = '<c-p>'
        "let g:ctrlp_cmd = 'ctrlp'
        "" 根据通配符来忽略不需要搜索的文件
        "set wildignore+=*\tmp\*,*/tmp/*,*.so,*.swp,*.zip,*.pyc
        "let g:ctrlp_root_markers = ['.svn', '.git', 'cfg.vim']
        "" 本地工作目录的规则，可设置以下选项
        "" 'c' - 设为当前文件所在的目录
        "" 'r' - 如果最近的祖先有包含以下目录，则将该祖先目录设为工作目录：.git .hg .svn .bzr _darcs, 
        "" 'a' - 和c选项类似，理解为仅在r不生效的情况下，才执行c选项
        "let g:ctrlp_working_path_mode = 'ra'
        "" 哪些文件、目录、链接不在搜索范围内
        "let g:ctrlp_custom_ignore = {
                 "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
                 "\ 'file': '\v\.(exe|so|dll|zip|gzip)$',
                 "\ 'link': 'data',
                 "\ }
    "Plug 'tacahiroy/ctrlp-funky'
        "nnoremap <Leader>fu :CtrlPFunky<Cr>
        "" narrow the list down with a word under cursor
        "nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    Plug 'airblade/vim-rooter'
        let g:rooter_patterns = ['cfg.vim', '.git']
    Plug 'mileszs/ack.vim'
        if executable('rg')
          let g:ackprg = 'rg --vimgrep'
        endif
    "折叠代码
    Plug 'tmhedberg/SimpylFold'

        "Enable folding
        set foldmethod=indent
        set foldlevel=99
        nnoremap <space> za
        let g:SimpylFold_docstring_preview=1

    "Plug 'neoclide/coc.nvim' 
    "Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
        "------------ COC config-------------------"
        "\'coc-pairs',
        """
        let g:coc_global_extensions = [
                    \'coc-pyright',
                    \'coc-json',
                    \'coc-vimlsp',
                    \'coc-marketplace',
                    \'coc-xml',
                    \'coc-snippets',
                    \'coc-lists',
                    \'coc-highlight'
                    \]

        " Use `[g` and `]g` to navigate diagnostics
        " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " GoTo code navigation.
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        "------------ COC config-------------------"
    "Plug 'davidhalter/jedi-vim'
        "let g:jedi#environment_path = "D:/sw/miniconda3/envs/py39/"
        "let g:jedi#auto_initialization = 1
        "let g:jedi#auto_vim_configuration = 1
        "let g:jedi#use_tabs_not_buffers = 1
        "let g:jedi#use_splits_not_buffers = "left"
        "let g:jedi#popup_on_dot = 0
        "let g:jedi#popup_select_first = 0
        "let g:jedi#show_call_signatures = "1"

        "let g:jedi#goto_command = "<leader>d"
        "let g:jedi#goto_assignments_command = "<leader>g"
        "let g:jedi#goto_stubs_command = "<leader>s"
        "let g:jedi#goto_definitions_command = ""
        "let g:jedi#documentation_command = "K"
        "let g:jedi#usages_command = "<leader>n"
        "let g:jedi#completions_command = "<C-Space>"
        "let g:jedi#rename_command = "<leader>r"
    Plug 'majutsushi/tagbar'
        map <Leader>tb :TagbarToggle<CR>      "快捷键设置
        let g:tagbar_ctags_bin=bundle_dir.'exe/ctags'          "ctags程序的路径
        let g:tagbar_width=30                   "窗口宽度的设置
        noremap <F3> :Tagbar<CR>
        "autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'jistr/vim-nerdtree-tabs'
      let NERDTreeIgnore=['.pyd','\.pyc$','__pycache_','.bak', '\~$'] "ignore files in NERDTree
      map <F2> <esc>:NERDTreeToggle<cr>
    Plug 'fholgado/minibufexpl.vim'
        let g:miniBufExplMapWindowNavVim = 1   
        let g:miniBufExplMapWindowNavArrows = 1   
        let g:miniBufExplMapCTabSwitchBufs = 1   
        let g:miniBufExplModSelTarget = 1  
        let g:miniBufExplMoreThanOne=0
        map <F11> :MBEbp<CR>
        map <F12> :MBEbn<CR>
    Plug 'altercation/vim-colors-solarized'
    Plug 'iCyMind/NeoSolarized'
  
        " default value is "normal", Setting this option to "high" or "low" does use the 
        " same Solarized palette but simply shifts some values up or down in order to 
        " expand or compress the tonal range displayed.
        "let g:neosolarized_contrast = "high"

        " Special characters such as trailing whitespace, tabs, newlines, when displayed 
        " using ":set list" can be set to one of three levels depending on your needs. 
        " Default value is "normal". Provide "high" and "low" options.
        "let g:neosolarized_visibility = "high"

        " I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
        " style more, set this value to 0.
        "let g:neosolarized_vertSplitBgTrans = 1

        " If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized 
        " typefaces, simply assign 1 or 0 to the appropriate variable. Default values:  
        let g:neosolarized_bold = 1
        let g:neosolarized_underline = 1
        let g:neosolarized_italic = 0
        set background=dark
        let g:solarized_termcolors=256
    Plug 'bling/vim-airline'
        set laststatus=2
    Plug 'Yggdroot/indentLine'
        let g:indentLine_char_list = ['1', '2', '3', '4','5','6','7']


    Plug 'nvie/vim-flake8'
        "let g:flake8_quickfix_height=7
    "Plug 'cjrh/vim-conda'
        "nnoremap <leader>env :CondaChangeEnv<CR>
    Plug 'stevearc/vim-arduino'
        nnoremap <buffer> <leader>am :ArduinoVerify<CR>
        nnoremap <buffer> <leader>au :ArduinoUpload<CR>
        nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
        nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
        nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

    Plug 'skywind3000/vim-terminal-help'
call plug#end()


set ts=4
set shiftwidth=4
set expandtab

set foldmethod=indent
set nu
set hls

highlight LineNr ctermfg=red

set ruler
set invlist "display tab and space
set listchars=tab:>-,trail:.,space:.
set clipboard=unnamed

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap <C-S> <esc>:w<cr>
inoremap jk <esc>
"let javascript_enable_domhtmlcss=1
noremap <F4> :call RunTest()<CR>
fun! RunTest()
    exec "w"
    if &filetype == 'python'
        let test_file_dir = join(['Test_', expand('%')],'')
        if filereadable(test_file_dir)
            echo(test_file_dir)
            "exec "!python " . test_file_dir. "| iconv -f cp936 -t utf-8"
            exec "!python % | iconv -f cp936 -t utf-8"
        else
            exec "!python %"
        endif
    endif
endfunc "<<RunTest
"插入断点
fun! InsertLineNumber()
    "TODO 如果时数字则删除
    " 插入当前行号
    :execute "normal! a".line(".")." "
endfunc
fun! InserDebugMsg()
    "输出光标下的单词
    ":execute "normal! viwyoprint('Dbg:"
    ":execute "normal! a".shellescape(expand("%:t"))
    ":execute "normal! a :".line(".").' '
    ":execute "normal! pa=',"
    ":execute "normal! pa)"
    :execute "normal! viwyologging.debug('"
    :execute "normal! pa='+json.dumps("
    :execute "normal! pa,indent = 4))"
endfunc
fun! SetBreakPoint()
    :execute "normal Iimport ipdb as pdb;pdb.set_trace()\n"
    echo "F9插入断点， 列出断点命令还未想好"
endfunc "<<SetBreakPoint
fun! Run()
    exec "w"
    if &filetype == 'python'
        "let dir= getcwd()
        "let tmp = split(dir,'Test_')
        "echo(tmp)
        exec "!python  %"
    endif
endfunc
noremap <F8> :call Pep8()<CR>
fun! Pep8()
    exec "w"
    if &filetype == 'python'
        exec "!black %"
        "exec "!pycodestyle --first %"
        "exec "!flake8 %"
    endif
endfunc
if filereadable("cfg.vim")
   source cfg.vim
endif

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
"autocmd BufReadPost *.json 
colorscheme NeoSolarized "设置着色
set encoding=utf-8
set conceallevel=0 "json文件显示引号
augroup key_map
    autocmd!
    noremap <F9> :call SetBreakPoint()<CR>
    nnoremap <leader>dbg :call SetBreakPoint()<CR>
    "编辑和配置vimrc文件
    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>
    nnoremap <Leader>pd :call InserDebugMsg()<CR>
    noremap <F5> :call Run()<CR>
    nnoremap <Leader>l :call InsertLineNumber()<CR>
    nnoremap <Leader>it "=strftime("%F %X")<CR>gP
augroup end
