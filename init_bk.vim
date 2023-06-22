" set nocompatible
" syntax on
" filetype off
" set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
" set updatetime=100
" set shortmess+=c
" set termguicolors

"let g:ctrlp_map = '<leader>p'
"

let bundle_dir = 'D:/gcbb/vim/bundles/'
set rtp+='D:/sw/vim/vimfiles/'
let g:my_vimrc_dir = fnamemodify((expand('$MYVIMRC')), ':p:h')
" let g:my_vimrc_dir = fnamemodify(resolve(expand('$MYVIMRC')), ':p:h')
call plug#begin(bundle_dir)


    Plug 'tpope/vim-surround'

        " 添加包围符号：ysiw"
        " cs{from}{to}：cs"'表示将当前光标处的引号替换为双引号。
        " ys{motion}{to}：例如，ysiw)表示在当前单词上添加括号。
        " yss{to}：yss[表示在当前行上添加方括号。
        " 删除包围符号：
        " ds{from}：ds"表示删除当前光标处的引号。
        " ysiw{to}：将当前单词添加包围符号to，然后删除当前光标处的包围符号。
        " yss{to}：在当前行上添加包围符号to，然后删除当前光标处的包围符号。
        " 修改包围符号：
        " cs{from}{to}：效果相当于删除再添加。
        "
    " Plug 'bling/vim-airline'
        " set laststatus=2
        

    "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

            "let g:mkdp_browser='chrome'
        " set to 1, nvim will open the preview window after entering the markdown buffer
        " default: 0
        let g:mkdp_auto_start = 0

        " set to 1, the nvim will auto close current preview window when change
        " from markdown buffer to another buffer
        " default: 1
        let g:mkdp_auto_close = 1

        " set to 1, the vim will refresh markdown when save the buffer or
        " leave from insert mode, default 0 is auto refresh markdown as you edit or
        " move the cursor
        " default: 0
        let g:mkdp_refresh_slow = 0

        " set to 1, the MarkdownPreview command can be use for all files,
        " by default it can be use in markdown file
        " default: 0
        let g:mkdp_command_for_global = 0

        " set to 1, preview server available to others in your network
        " by default, the server listens on localhost (127.0.0.1)
        " default: 0
        let g:mkdp_open_to_the_world = 0

        " use custom IP to open preview page
        " useful when you work in remote vim and preview on local browser
        " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
        " default empty
        let g:mkdp_open_ip = ''

        " specify browser to open preview page
        " for path with space
        " valid: `/path/with\ space/xxx`
        " invalid: `/path/with\\ space/xxx`
        " default: ''
                    let g:mkdp_browser='C:/Program Files/Google/Chrome/Application/chrome.exe'

        " set to 1, echo preview page url in command line when open preview page
        " default is 0
        let g:mkdp_echo_preview_url = 0

        " a custom vim function name to open preview page
        " this function will receive url as param
        " default is empty
        let g:mkdp_browserfunc = ''

        " options for markdown render
        " mkit: markdown-it options for render
        " katex: katex options for math
        " uml: markdown-it-plantuml options
        " maid: mermaid options
        " disable_sync_scroll: if disable sync scroll, default 0
        " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
        "   middle: mean the cursor position alway show at the middle of the preview page
        "   top: mean the vim top viewport alway show at the top of the preview page
        "   relative: mean the cursor position alway show at the relative positon of the preview page
        " hide_yaml_meta: if hide yaml metadata, default is 1
        " sequence_diagrams: js-sequence-diagrams options
        " content_editable: if enable content editable for preview page, default: v:false
        " disable_filename: if disable filename header for preview page, default: 0
        let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0,
            \ 'toc': {}
            \ }

        " use a custom markdown style must be absolute path
        " like '/Users/username/markdown.css' or expand('~/markdown.css')
        let g:mkdp_markdown_css = ''

        " use a custom highlight style must absolute path
        " like '/Users/username/highlight.css' or expand('~/highlight.css')
        let g:mkdp_highlight_css = ''

        " use a custom port to start server or empty for random
        let g:mkdp_port = ''

        " preview page title
        " ${name} will be replace with the file name
        let g:mkdp_page_title = '「${name}」'

        " recognized filetypes
        " these filetypes will have MarkdownPreview... commands
        let g:mkdp_filetypes = ['markdown']

        " set default theme (dark or light)
        " By default the theme is define according to the preferences of the system
        let g:mkdp_theme = 'wite'

    Plug 'nvie/vim-flake8'
        "let g:flake8_quickfix_height=7
        
    Plug 'stevearc/vim-arduino'
        nnoremap <buffer> <leader>am :ArduinoVerify<CR>
        nnoremap <buffer> <leader>au :ArduinoUpload<CR>
        nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
        nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
        nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

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
":bufdo e
"let javascript_enable_domhtmlcss=1
"插入断点
fun! InsertLineNumber()
    "TODO 如果时数字则删除
    " 插入当前行号
    :execute "normal! a".line(".")." "
endfunc
fun! InserDebugMsg(mode)
    "输出光标下的单词
    if (a:mode != "json")
        :execute "normal! viwyoLogger.debug('"
        :execute "normal! pa='+str("
        :execute "normal! pa))"
    else
        :execute "normal! viwyoLogger.debug('"
        :execute "normal! pa='+json.dumps("
        :execute "normal! pa,indent = 4))"
    endif
endfunc

fun! InserDebugJsonMsg()
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
    :execute "normal Iimport ipdb as pdb;pdb.set_trace()"
endfunc "<<SetBreakPoint

fun! RunFile(mode)
    exec "w"
    if &filetype == 'python'

        if (a:mode == "test")
            let test_file_dir = join(['Test_', expand('%')],'')
            if ! filereadable(test_file_dir)
                let test_file_dir = join(['test/test_', expand('%')],'')
            endif

            echo(test_file_dir)
            exec ':H python '.test_file_dir
        elseif(a:mode=="main")
            if filereadable("main_.py")
                exec ':H python main_.py'
            endif
        else
            exec ':H python '.expand('%')
        endif

    elseif  &filetype == 'dosbatch'
        exec ':H ./'.expand('%')
    elseif &filetype == 'markdown'
        "nmap <F11> <Plug>MarkdownPreview
        "nmap <M-s> <Plug>MarkdownPreviewStop
        exec ':MarkdownPreviewToggle'
    endif
endfunc

fun! RunDbug()
    exec "w"
    if &filetype == 'python'
        exec ':H python -m ipdb '.expand('%')
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

" 测试断点标识, 有VIMSPECTOR 该函数不用了
"python3 <<EOF
"vim_ipython_path ='D:/gcbb/vim/nvim'# vim.eval("expand('<sfile>:h')")
"sys.path.append(vim_ipython_path)
"from gdebug import vim_project
"#vim_prj = vim_project()

"EOF

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
endif
endfunction


augroup key_map
    autocmd!


     "Use `[g` and `]g` to navigate diagnostics
     "Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <leader>rn <Plug>(coc-rename)

    nmap <leader>tr :NERDTreeToggle<CR>

    nnoremap <silent> K :call ShowDocumentation()<CR>

    "autocmd CursorHold * silent call CocActionAsync('highlight')

    " ----------COC snippets---------------
    " Use <C-l> for trigger snippet expand.
    xmap <leader>x  <Plug>(coc-convert-snippet)
    inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  let g:coc_snippet_next = '<tab>'
    let g:coc_snippet_next = '<c-j>'
    let g:coc_snippet_prev = '<c-k>'

    " ----------COC snippets end---------------
    nnoremap ,duuid :%s/ UUID=\S*>/>/g<cr>
" -------------markdown- 在RunFile 调用--------------------

augroup end

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd BufRead,BufNewFile *.can set filetype=c
  autocmd BufRead,BufNewFile *.arxml set filetype=xml
" indentLine 
autocmd FileType json,markdown let g:indentLine_conceallevel = 0
" vim-json
autocmd FileType json,markdown let g:vim_json_syntax_conceal = 0

" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

