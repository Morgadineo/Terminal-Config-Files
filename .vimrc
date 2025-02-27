call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set termguicolors
set completeopt=menuone,noinsert,noselect
set number            " Mostrar números nas linhas
set expandtab ts=4 sw=4 ai " Configurações de indentação
set noexpandtab       " Desabilita a expansão de tabs (se preferir manter)
set signcolumn=no

syntax enable         " Habilitar destaque de sintaxe

inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"

autocmd FileType python syntax match pythonSelf /\<self\>/
highlight pythonSelf ctermfg=LightGreen guifg=LightGreen

" Configurar CTRL-DEL para apagar a palavra à esquerda
inoremap <C-Del> <C-W>

" Alterar as cores do menu de sugestões no coc.nvim

" Cor de fundo do menu de sugestões
highlight PMenu ctermbg=DarkGray guibg=#2e2e2e

" Cor do texto do menu de sugestões
highlight PMenu ctermfg=White guifg=#FFFFFF

" Cor de fundo da sugestão selecionada
highlight PMenuSel ctermbg=Blue guibg=#4e82ff

" Cor do texto da sugestão selecionada
highlight PMenuSel ctermfg=Black guifg=#000000

" Cor de fundo do "thumb" (parte que destaca o item selecionado)
highlight PMenuThumb ctermbg=White guibg=#c1c1c1


" Quebra de linha automática para parágrafos grandes
set textwidth=80         " Largura máxima da linha (pode ajustar conforme preferir)
set wrap                 " Habilita o "wrap" (quebra de linha visual)
set linebreak            " Quebra a linha em espaços (evita cortar palavras no meio)
set formatoptions+=t     " Quebra de parágrafos no modo de inserção

autocmd FileType python highlight Comment ctermfg=Green guifg=Green
autocmd FileType python highlight SpecialComment ctermfg=Blue guifg=Blue
highlight Comment ctermfg=Green guifg=Green
