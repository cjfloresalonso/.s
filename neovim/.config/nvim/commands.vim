" follow the
let leader = '\'

" diable highlight
map <silent> \<cr> :noh<cr>

" paste mode
nmap \pp :setlocal paste!<cr>

" fast save
nmap \w :w!<cr>

" sudo save
command W w !sudo tee % > /dev/null

" customisation
map \e :e! ~/.config/nvim/init.vim<cr>
map \z :e! ~/.zshrc<cr>
map \x :e ./todo.md<cr> 

" create tags
command! MakeTags !ctags -R .

" NERDTree
map \b :NERDTreeToggle<CR>
