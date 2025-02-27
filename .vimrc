call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tversteeg/quick-scope'
call plug#end()

set termguicolors
set completeopt=menuone,noinsert,noselect
set number            " Mostrar números nas linhas
set expandtab ts=4 sw=4 ai " Configurações de indentação
set noexpandtab       " Desabilita a expansão de tabs (se preferir manter)
set signcolumn=no
set foldmethod=indent

syntax enable         " Habilitar destaque de sintaxe

inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"

autocmd FileType python syntax match pythonSelf /\<self\>/
highlight pythonSelf ctermfg=Red guifg=Red

" Alterar as cores do menu de sugestões no coc.nvim
highlight PMenu ctermbg=DarkGray guibg=#2e2e2e
highlight PMenu ctermfg=White guifg=#FFFFFF
highlight PMenuSel ctermbg=Blue guibg=#4e82ff
highlight PMenuSel ctermfg=Black guifg=#000000
highlight PMenuThumb ctermbg=White guibg=#c1c1c1

" Quebra de linha automática para parágrafos grandes
set textwidth=80         " Largura máxima da linha (pode ajustar conforme preferir)
set wrap                 " Habilita o "wrap" (quebra de linha visual)
set linebreak            " Quebra a linha em espaços (evita cortar palavras no meio)
set formatoptions+=t     " Quebra de parágrafos no modo de inserção

autocmd FileType python highlight Comment ctermfg=Green guifg=Green
autocmd FileType python highlight SpecialComment ctermfg=Blue guifg=Blue
highlight Comment ctermfg=Green guifg=Green
