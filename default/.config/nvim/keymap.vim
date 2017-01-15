" Space disables highlighting of currently matched search pattern
nnoremap <space> :nohlsearch<CR>

" wrapped lines: go to next row instead of next line
nnoremap j gj
nnoremap k gk

" Y yanks to the end of the line instead of the whole line (like D)
nnoremap Y y$
" vv selects the whole line, just like dd deletes the whole line
nnoremap vv V
" V selects till the end of the line just like D deletes till eol
nnoremap V v$h
" Yanking in visual mode doesn't move the cursor back to where it was
vnoremap <expr>y "my\"" . v:register . "y`y"

" s saves current buffer
nnoremap s :w<CR>
" S saves with sudo
nnoremap S :w !sudo tee > /dev/null %<CR>

" x closes the current buffer
nnoremap <silent> x :call WipeButKeepOpen(0)<CR>
" X closes the current buffer even if it was modified
nnoremap <silent> X :close<CR>

" R reloads the current buffer
nnoremap R :e!<CR>

" . repeats the last action on a visual block
vnoremap . :normal .<CR>

" Move between splits with alt+mov key
for i in ['h', 'j', 'k', 'l', 'H', 'J', 'K', 'L']
    execute('noremap <A-' . i . '> <C-w>' . i)
    execute('inoremap <A-' . i . '> <Esc><C-w>' . i)
    execute('tnoremap <A-' . i . '> <C-\><C-n><C-w>' . i)
endfor
tnoremap <silent> <A-Space> <C-\><C-n>:set laststatus=2<CR>:let b:should_insert = 0<CR>:tnoremap <A-Space> <C-\><C-n>:silent let b:should_insert=0<CR>

" Suggest a spelling correction
nnoremap <C-s> z=
inoremap <C-x><C-s> <C-x><C-s><C-n>

" Move in command line mode using hjkl
for i in ["<C-h> <left>", "<C-j> <down>", "<C-k> <up>", "<C-l> <right>",
            \ "<C-a> <Home>", "<C-e> <End>"]
    execute('lnoremap ' . i)
    " Cnoremap is needed because lnoremap won't redefine some of these
    " mappings for some reason
    execute('cnoremap ' . i)
endfor

" Go to a tab by using alt+colnum
noremap <A-&> 1gt
noremap <A-é> 2gt
noremap <A-"> 3gt
noremap <A-'> 4gt
noremap <A-(> 5gt
noremap <A--> 6gt
noremap <A-è> 7gt
noremap <A-_> 8gt
noremap <A-ç> 9gt
noremap <A-à> 10gt

" Move tabs by using alt+shift+colnum
let i = 1
while i <= 10
    execute('noremap  <silent> <A-' . i . '> :tabm . ' . i . '<CR>')
    execute('inoremap <silent> <A-' . i . '> :tabm . ' . i . '<CR>')
    let i = i + 1
endwhile

" Create a new tab
nnoremap <silent> <C-w>t :tabnew<CR>

" Redo with U
nnoremap U <C-r>

" TODO: Play last recorded macro with Q
nnoremap Q @@

" Do not exit Visual mode when shift-indenting
vnoremap < <gv
vnoremap > >gv
" Do not exit Visual mode when incrementing
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
" Do not exit Visual mode after changing case
vnoremap ~ ~gv

" Call a function that checks whether we can suspend or not
nnoremap <C-z> :call SuspendIfInShell()<CR>
vnoremap <C-z> <Esc> :call SuspendIfInShell()<CR>gv
