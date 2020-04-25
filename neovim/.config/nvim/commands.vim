" follow the
let leader = '\'

" diable highlight
map <silent> \<cr> :noh<cr>

" paste mode
map \pp :setlocal paste!<cr>

" fast save
nmap \w :w!<cr>

" sudo save
command W w !sudo tee % > /dev/null

" customisation
map \e :e! ~/.config/nvim/init.vim<cr>
map \x :e ./todo.md<cr> 

" create tags
command! MakeTags !ctags -R .
