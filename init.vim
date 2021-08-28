set encoding=utf-8
set nocompatible
syntax on
filetype off
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set updatetime=100
set shortmess+=c
let mapleader = ","
let bundle_dir = 'd:/sw/vim/bundles/'
let cfg_dir = 'd:/gcbb/vim/nvim/'
set rtp+='D:/sw/vim/vimfiles/'
let g:python3_host_prog = 'D:/sw/anaconda3/python.exe'
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
call plug#begin(bundle_dir)

    "缺失命令jobid 
    "Plug 'jpalardy/vim-slime'

        "let g:slime_paste_file = tempname()
        "let g:slime_target = "neovim"
        "let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
        "let g:slime_python_ipython = 1
    "Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' }#
    "都ipy格式，，不能编辑，运行。 没用
    "Plug 'szymonmaszke/vimpyter' "vim-plug
    "Plug 'ivanov/vim-ipython'
    "Plug 'bfredl/nvim-ipy'
    "
    "Plug 'ncm2/ncm2' 
    "Plug 'roxma/nvim-yarp'
    
    "花里胡哨的 语法高亮。。。动不动就死机, 我不喜欢
    "Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}"python语法高亮
        "nmap <silent> <leader>ee :Semshi error<CR>
        "nmap <silent> <leader>ge :Semshi goto error<CR>
        "hi semshiLocal           ctermfg=209 guifg=#ff875f
        "hi semshiGlobal          ctermfg=214 guifg=#ffaf00
        "hi semshiImported        ctermfg=214 guifg=#0000FF cterm=bold gui=bold
        "hi semshiParameter       ctermfg=75  guifg=#5fafff
        "hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
        "hi semshiFree            ctermfg=218 guifg=#ffafd7
        "hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
        "hi semshiAttribute       ctermfg=49  guifg=#00ffaf
        "hi semshiSelf            ctermfg=249 guifg=#b2b2b2
        "hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
        "hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
        "hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
        "hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
        "sign define semshiError text=E> texthl=semshiErrorSign
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
        nnoremap <c-f> :FZF<CR>
        nmap <C-p> :Files<CR>
        nmap <C-e> :Buffers<CR>
        let g:fzf_action = { 'ctrl-e': 'edit' }
    "Plug 'neoclide/Roc.nvim' 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
        "------------ COC config-------------------"
        "\'coc-pairs',
        """

        let g:coc_global_extensions = [
                    \'coc-python',
                    \'coc-json',
                    \'coc-vimlsp',
                    \'coc-marketplace',
                    \'coc-xml',
                    \'coc-snippets',
                    \'coc-lists',
                    \'coc-markdownlint',
                    \'coc-pyright',
                    \'coc-highlight',
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
    "折叠代码
    Plug 'tmhedberg/SimpylFold'
        "Enable folding
        set foldmethod=indent
        set foldlevel=99
        nnoremap <space> za
        let g:SimpylFold_docstring_preview=1

    Plug 'airblade/vim-rooter'
        let g:rooter_patterns = ['cfg.vim', '.git']
    Plug 'overcache/NeoSolarized'
        if has("termguicolors")
            set termguicolors
        endif 
        " Default value is "normal", Setting this option to "high" or "low" does use the same Solarized palette but simply shifts some values up or down in order to
        " expand or compress the tonal range displayed.
        let g:neosolarized_contrast = "normal"

        " Special characters such as trailing whitespace, tabs, newlines, when displayed
        " using ":set list" can be set to one of three levels depending on your needs.
        " Default value is "normal". Provide "high" and "low" options.
        let g:neosolarized_visibility = "normal"

        " I make vertSplitBar a transparent background color. If you like the origin
        " solarized vertSplitBar style more, set this value to 0.
        let g:neosolarized_vertSplitBgTrans = 1

        " If you wish to enable/disable NeoSolarized from displaying bold, underlined
        " or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
        " Default values:
        let g:neosolarized_bold = 1
        let g:neosolarized_underline = 1
        let g:neosolarized_italic = 0
        " Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
        " text output by commands like `ls` aren't what you expect, you might want to
        " try disabling this option. Default value:
        let g:neosolarized_termBoldAsBright = 1
        let g:coc_default_semantic_highlight_groups = 1
        highlight CocSymbolMethod ctermfg=Red  guifg=#00fFFF
        set background=dark
    Plug 'majutsushi/tagbar'
        map <Leader>tb :TagbarToggle<CR>      "快捷键设置
        let g:tagbar_ctags_bin=cfg_dir.'exe/ctags'          "ctags程序的路径
        let g:tagbar_width=30                   "窗口宽度的设置
        noremap <F3> :Tagbar<CR>
        "autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启
        "Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdtree'
        let NERDTreeIgnore=['.pyd','\.pyc$','__pycache_','.bak', '\~$'] "ignore files in NERDTree
        map <F2> <esc>:NERDTreeToggle<cr>
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
    Plug 'scrooloose/nerdcommenter'

    Plug 'fholgado/minibufexpl.vim'
        let g:miniBufExplMapWindowNavVim = 1   
        let g:miniBufExplMapWindowNavArrows = 1   
        let g:miniBufExplMapCTabSwitchBufs = 1   
        let g:miniBufExplModSelTarget = 1  
        let g:miniBufExplMoreThanOne=0
        map <F11> :MBEbp<CR>
        map <F12> :MBEbn<CR>

    Plug 'bling/vim-airline'
        set laststatus=2
    Plug 'Yggdroot/indentLine'
        let g:indentLine_char_list = ['1', '2', '3', '4','5','6','7']

    Plug 'nvie/vim-flake8'
        "let g:flake8_quickfix_height=7
        "Plug 'cjrh/vim-conda'
        "nnoremap <leader>env :CondaChangeEnv<CR>
    Plug 'skywind3000/vim-terminal-help'
        
call plug#end()

colorscheme NeoSolarized
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
fun! SendCode()
    "将 %% %% 段内的内容按行发送到 终端运行
    "python need run python in term first
    "require 
    "Plug 'skywind3000/vim-terminal-help'
    :let start = line('.')
    :let n = 1
    :let start = search('%%', 'nb', line("w0"))
    :let end = search('%%', 'n', line("w$"))
    :let lines = getline(start, end)
    :for line in lines
        :let tmp = matchstr(line, '^\s*#')
        :let tmp_txt_len =  len(tmp)
        :if tmp_txt_len == 0
            exec ":H ".line
        :endif
    :endfor
endfunc

function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction
set encoding=utf-8
augroup key_map
    autocmd!
    noremap <F9> :call SetBreakPoint()<CR>
    let mapleader = ","
    nnoremap <leader>dbg :call SetBreakPoint()<CR>
    "编辑和配置vimrc文件
    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>
    nnoremap <Leader>pd :call InserDebugMsg()<CR>
    noremap <F5> :call Run()<CR>
    nnoremap <Leader>l :call InsertLineNumber()<CR>
    nnoremap <Leader>it "=strftime("%F %X")<CR>gP
    "nnoremap <c-r> :call SendCode()<CR>
    nnoremap <c-cr> :call SendCode()<CR>

augroup end

set conceallevel=0 "json文件显示引号
augroup file_set
    "特定文件类操作型设定
    autocmd!

    autocmd BufReadPost *.json let g:konceallevel=0 "json文件显示引号
augroup end

