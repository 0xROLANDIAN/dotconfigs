return {
	{ 'folke/tokyonight.nvim' },
	-- The purpose of this plugin is to bundle all the "boilerplate code" necessary to have nvim-cmp (a popular autocompletion plugin) and nvim-lspconfig working together. And if you opt in, it can use mason.nvim to let you install language servers from inside neovim.
	
	-- LSP Zero
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	
	--Plenary
	{ 'nvim-lua/plenary.nvim' },
	
	--Stylua
	{ 'ckipp01/stylua-nvim' },
	
	-- Prettier
	{ 'jose-elias-alvarez/null-ls.nvim' },
	{ 'MunifTanjim/prettier.nvim' },
	
	-- Vim Airline
	{ 'vim-airline/vim-airline' },
	{ 'vim-airline/vim-airLINE-themes' },
	{ 'edkolev/tmuxline.vim' },

	-- Tmuxline vim
	{ 'edkolev/promptline.vim' },

	--Vim Fugutive
	{ 'tpope/vim-fugitive' },

	--RipGrep
	{ 'BurntSushi/ripgrep' },

	--Markdownpreview
	{
		"iamcco/markdown-preview.nvim",
		event = "BufRead",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

}

---- Keep as a reference for a while
-- {'stephpy/vim-php-cs-fixer'},
-- {'conornewton/vim-latex-preview'},
-- {'Vimwiki/Vimwiki'},
-- {'altercation/vim-colors-solarized'},
-- 'scrooloose/nerdtree'},
-- 'Yggdroot/indentLine'},
