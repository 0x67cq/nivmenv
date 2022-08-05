" ===================== set keymapping =====================

" jk 替代 esc
inoremap jk <ESC>

" 定义<Leader>
let mapleader=";"

" 废弃快捷键
noremap <F1> <Nop>
inoremap <F1> <Nop>
nnoremap <Up> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Down> <Nop>

inoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Down> <Nop>

" 快速保存及退出
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>


" 调整窗口大小快捷键
nmap <C-W>> :resize +9<CR>
nmap <C-W>< :resize -9<CR>
nmap <C-W>+ :vertical resize -9<CR>
nmap <C-W>- :vertical resize +9<CR>

" 搜索关键词居中
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

nnoremap <silent><Leader><Leader> :nohlsearch<CR>

" * 搜索不移动 可视模式高亮选中
function! Starsearch_CWord()
    let wordStr = expand("<cword>")
    if strlen(wordStr) == 0 | return | endif
    if wordStr[0] =~ '\<'
        let @/ = '\<' . wordStr . '\>'
    else
        let @/ = wordStr
    endif
    let savedS = @s
    normal! "syiw
    let @s = savedS
    set hlsearch
endfunction

function! Starsearch_VWord()
    let savedS = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, '\'), '\n', '\\n', 'g')
    let @s = savedS
    set hlsearch
endfunction

nnoremap <silent> * :set nohlsearch\|:call Starsearch_CWord()<CR>
vnoremap <silent> * :<C-u>set nohlsearch\|:call Starsearch_VWord()<CR>

" 调整缩进后自动选中
vnoremap < <gv
vnoremap > >gv

" w!!用sudo保存
cabbrev w!! w !sudo tee > /dev/null %

"打开quickfix
nmap qf :copen<cr>
nmap q[ :cnext<cr>
nmap q] :cprevious<cr>


