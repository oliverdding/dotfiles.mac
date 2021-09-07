" {{{ Global Variables

let g:is_posix = 1                                  " Assume shell for syntax highlighting.

" Settings for custom statusline.
if !exists('g:vscode')
    let g:lightline = {
        \ 'colorscheme': 'nord',
        \ }
endif

" Extensions (plugins) for CoC language client.
let g:coc_global_extensions = [
  \ 'coc-emoji',
  \ 'coc-explorer',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-syntax',
  \ 'coc-toml',
  \ 'coc-yaml',
  \]

" Global Variables }}}

" {{{ Plugins Related

call plug#begin('~/.local/share/nvim/plugin/')

if !exists('g:vscode')
    Plug 'arcticicestudio/nord-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()

" Plugins Related }}}

" {{{ Vim options

colorscheme nord                                    " Set color scheme

set nocompatible                                    " Remove vi compatibility hacks.
let mapleader = "\<Space>"                          " Set <Leader> to Spacebar.

syntax enable                                       " Turn on syntax highlighting.
filetype plugin indent on                           " Use file-specific plugins and indentation rules.

set autoindent                                      " Moving to a new line keeps the same indentation (overridden by filetype indent on).
set autoread                                        " Auto read when file is changed elsewhere.
set backspace=indent,eol,start                      " Backspace works across lines.
set cmdheight=2                                     " Give more space for displaying messages.
set confirm                                         " Ask if you want to save unsaved files instead of failing.
set diffopt+=vertical                               " Always use vertical diffs.
set expandtab                                       " Insert spaces when tab key pressed.
set ffs=unix                                        " Force Unix line endings (\n) (always show \r (^M), never autoinsert them).
set foldmethod=expr foldlevel=99                    " Fold according to the syntax rules, expand all by default.
set formatoptions-=t                                " Don't autowrap text at 80.
set gdefault                                        " Global replace default (off: /g).
set hidden                                          " Don't force saving buffers on switching.
set history=1000                                    " More command/search history.
set hlsearch                                        " Highlight search matches (off: <Space>/).
set ignorecase                                      " Ignore case for lowercase searches (re-enable with \C in pattern),
set incsearch                                       " Incremental searching.
set laststatus=2                                    " Always display the status line.
set lazyredraw                                      " Don't redraw if you don't have to (e.g. in macros).
set list listchars=tab:»·,trail:·,nbsp:☠            " Display extra whitespace.
set mouse=a                                         " Mouse in all modes (mac: Fn+drag = copy).
set nojoinspaces                                    " One space (not two) after punctuation..
set nonumber                                        " Turn off line numbers.
set noshowmode                                      " Don't show when in insert mode (set in lightline).
set notildeop                                       " Keep tilde (~) as it's default. If you want the operator version use g~.
set ruler                                           " Always show cursor position.
set shiftwidth=4 tabstop=4 softtabstop=4            " Set tab width to 2.
set shortmess+=c                                    " Don't pass messages to |ins-completion-menu|.
set showcmd                                         " Display incomplete commands.
set signcolumn=number                               " Resize the sign column automatically.
set smartcase                                       "  ↳ don't for mixed-case.
set splitbelow                                      " Open new split panes to right and,
set splitright                                      "  ↳ bottom, which feels more natural.
set t_Co=256                                        " Use 256 color terminal.
set termguicolors                                   " Uses 24-bit colors in the terminal (guifg and guibg).
set undolevels=1000                                 " More undo history.
set updatetime=100                                  " Delay after which to write to swap file and run CursorHold event.
set visualbell                                      " Flash the screen instead of beeping when doing something wrong.
set wildchar=<Tab> wildmenu                         " Tab complete with files (e.g. `:e`)
set wildmode=list:longest,list:full                 " 1st Tab completes to longest common string, 2nd+ cycles through options.

let s:undodir = $XDG_CACHE_HOME . "/nvim/undo"
if !isdirectory(s:undodir)| call mkdir(s:undodir, "p", 0700)| endif
set path=.,/usr/include,,**                         " Add ** to the search path so :find x works recursively.
if exists('+breakindent')| set breakindent| let &showbreak = '↳   '| set cpo+=n| end " Nicer line wrapping for long lines.
if exists('&inccommand')| set inccommand=split| endif " Show search and replace as you type.
if exists("&wildignorecase")| set wildignorecase| endif " Case insensitive file tab completion with :e.

" Vim options }}}

" {{{ Key mappings

if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
else
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
    else
    inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

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

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
    " coc explorer
    nnoremap <space>e :CocCommand explorer<CR>
endif

" Key mappings }}}
