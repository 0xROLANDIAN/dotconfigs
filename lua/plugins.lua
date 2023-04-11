return {
  {'folke/tokyonight.nvim'},
-- LSP Zero
-- The purpose of this plugin is to bundle all the "boilerplate code" necessary to have nvim-cmp (a popular autocompletion plugin) and nvim-lspconfig working together. And if you opt in, it can use mason.nvim to let you install language servers from inside neovim.
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
},
{
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
     dependencies = { 'nvim-lua/plenary.nvim' }
    },

--Plenary
{'nvim-lua/plenary.nvim'},

-- Prettier
{'jose-elias-alvarez/null-ls.nvim'},
{'MunifTanjim/prettier.nvim'},

--Mine 
-- Vim Airline
{'vim-airline/vim-airline'},
{'vim-airline/vim-airLINE-themes'},
{'edkolev/tmuxline.vim'},

-- Tmuxline vim
{'edkolev/promptline.vim'},

--Vim Fugutive
{'tpope/vim-fugitive'},

--RipGrep
{'BurntSushi/ripgrep'}

}

-- Try these again sometime
-- 'nvim-lua/popup.nvim'},
-- 'nvim-lua/plenary.nvim'},
-- 'nvim-telescope/telescope.nvim'},
-- 'nvim-telescope/telescope-fzy-native.nvim'},

---- Keep as a reference for a while
-- -- 'iamcco/markdown-preview.nvim'}, { 'do': { -> mkdp#util#install() }, 'for': ['markdown'}, 'vim-plug']}
-- {'stephpy/vim-yaml'},
-- {'pedrohdz/vim-yaml-folds'},
-- {'neoclide/coc-vimtex'},
-- {'mracos/mermaid.vim'},
-- {'stephpy/vim-php-cs-fixer'},
--'neoclide/coc.nvim'}, '{'branch': 'release'}'},
-- {'conornewton/vim-latex-preview'},
-- {'Vimwiki/Vimwiki'},
-- {'neovim/nvim-lspconfig'
-- {'altercation/vim-colors-solarized'},
-- 'scrooloose/nerdtree'},
-- 'Yggdroot/indentLine'},
-- 'nvim-lua/popup.nvim'},
-- 'nvim-lua/plenary.nvim'},
-- 'nvim-telescope/telescope.nvim'},
-- 'nvim-telescope/telescope-fzy-native.nvim'},
-- 'rafcamlet/nvim-luapad'},

