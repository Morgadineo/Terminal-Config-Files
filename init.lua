-- Lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Gerenciador de Pacotes
  { 'nvim-lua/plenary.nvim' },

  -- Plugins de Interface e Aparência
  { 'navarasu/onedark.nvim', config = function() 
      require("onedark").setup()
      require("onedark").load()
    end 
  },

  -- Treesitter (Destaque de Sintaxe)
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {"python", "c"}
      }
    end 
  },

  -- File Explorer
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require("nvim-tree").setup { update_focused_file = { enable = true, update_cwd = true } } end
  },

  -- LSP e Autocompletar
  { 'neoclide/coc.nvim', branch = 'release' },

  -- Navegação e Busca
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, config = function()
      require("telescope").setup()
    end 
  },

  -- Melhorias na Edição
  {
      "stevearc/aerial.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      event = "BufReadPost",
  },

  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
})

-- Configurações gerais
vim.o.termguicolors = true                      -- Ativar suporte a cores 24 bits
vim.o.completeopt = "menuone,noinsert,noselect" -- Opções de autocomplete
vim.o.number = true                             -- Exibir números das linhas
vim.o.expandtab = true                          -- Usar espaços ao invés de tabs
vim.o.tabstop = 4                               -- Tamanho da tabulação
vim.o.shiftwidth = 4                            -- Tamanho do shift (indentação)
vim.o.signcolumn = "no"                         -- Desabilitar coluna de sinais

-- Habilitar destaque de sintaxe
vim.cmd("syntax enable")

-- Configurações do tema
vim.cmd('colorscheme onedark')
vim.g.onedark_style = 'deep'

-- Remover fundo das áreas do Neovim
vim.cmd('highlight Normal ctermbg=none guibg=none')  -- Remove o fundo das áreas normais
vim.cmd('highlight NonText ctermbg=none guibg=none')  -- Remove o fundo das áreas vazias
vim.cmd('highlight VertSplit ctermbg=none guibg=none')  -- Remove o fundo da divisão vertical
vim.cmd('highlight StatusLine ctermbg=none guibg=none')  -- Remove o fundo da barra de status
vim.cmd('highlight TabLine ctermbg=none guibg=none')  -- Remove o fundo da linha de abas
vim.cmd('highlight Pmenu ctermbg=none guibg=none')  -- Remove o fundo do menu de sugestões

-- Mapear Tab para o coc.nvim
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "\\<Tab>"', { noremap = true, expr = true, silent = true })

-- Mapear F8 para alternar o Tagbar
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })

-- Alternar entre números absolutos e relativos com F5
vim.api.nvim_set_keymap('n', '<F5>', ':set invnumber invrelativenumber<CR>', { noremap = true, silent = true })

-- Alterar as cores do menu de sugestões no coc.nvim
vim.cmd([[
  highlight PMenu ctermbg=DarkGray guibg=#2e2e2e
  highlight PMenu ctermfg=White guifg=#FFFFFF
  highlight PMenuSel ctermbg=Blue guibg=#4e82ff
  highlight PMenuSel ctermfg=Black guifg=#000000
  highlight PMenuThumb ctermbg=White guibg=#c1c1c1
]])

-- Quebra de linha automática
vim.o.wrap = true                -- Habilitar a quebra de linha visual
vim.o.linebreak = true           -- Quebra a linha em espaços
vim.o.formatoptions = vim.o.formatoptions .. "t"  -- Quebra de parágrafos no modo de inserção
vim.o.textwidth = 80             -- Limite de largura para texto (quebra automática)

--# CONFIGURAÇÃO DOS PLUGINS #--

-- Configuração do treesiter:
require('nvim-treesitter.configs').setup {
  ensure_installed = {"python", "c"},  -- Instala todos os parsers de linguagens disponíveis
  highlight = { enable = true },   -- Ativar o destaque de sintaxe
}

require("nvim-tree").setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  }
}

-- Configuração do Telescope:
require('telescope').setup{}

-- Configuração de auto-pairs (fecha automaticamente parênteses, colchetes, etc.):
require('nvim-autopairs').setup{}

-- Configuração do Aerials:
require("aerial").setup({
   icons = {
    Class = "󰠱 ",
    Function = "󰡱 ",
    Method = "󰡳 ",
    Namespace = "󰢮 ",
    Variable = "󰀲 ",
    Constant = "󰏿 ",
    Property = "󰜢 ",
    Field = "󰟴 ",
    Interface = "󰜙 ",
    Enum = "󰀬 ",
    Struct = "󰌗 ",
    Module = "󰕳 ",
    TypeParameter = "󰘗 ",
  },
  highlight_on_hover = true,
  highlight_on_jump = 300,
  autojump = true,
  show_guides = true,
  layout = {
    min_width = 30,
    default_direction = "prefer_right",
  },
  guides = {
    mid_item = "├ ",
    last_item = "└ ",
    nested_top = "│ ",
    whitespace = "  ",
  },
})

