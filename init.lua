--https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/tutorial.md
--https://github.com/LuaLS/lua-language-server/wiki/Formatter

-- Leader key
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
	print("Installing lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Done.")
end

vim.opt.rtp:prepend(lazypath)
-- Lazy Plugin manager, plugins are in lua/                 lugins.lua
require("lazy").setup("plugins", {
	-- Plugins move to lua/plugins.lua
})

-- LSP
local lsp = require("lsp-zero").preset({})
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

--
-- CMP
-- cmp-nvim override default bindings
-- https://github.com/hrsh7th/nvim-cmp
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})

--lsp format
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

---null-ls-vim
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
					   null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.completion.spell,
    },
})

--
--null_ls.setup({
--	debug = true,
--	print('null_ls setup'),
--	on_attach = function(client, bufnr)
--		if client.supports_method("textDocument/formatting") then
--			print('Hello world')
--			vim.keymap.set("n", "<Leader>f", function()
--							vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--			end, { buffer = bufnr, desc = "[lsp] format" })
--			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
--			vim.api.nvim_create_autocmd(event, {
--buffer = bufnr,
--				group = group,
--				callback = function()
--				vim.lsp.buf.format({ bufnr = bufnr, async = async })
--				end,
--desc = "[lsp] format on save",
--			})
--		end
--	end
--})

-- Prettier
				local prettier = require("prettier")

prettier.setup({
	bin = "prettier", -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"graphql",
		"html",
"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})

-- -- Telescope
-- require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
-- <C-x> go to file selection as a split
-- <C-v> go to file selection as a vsplit
-- <C-t> go to a file in a new tab
--
--file_ignore_patterns = {"node_modules"}
--
-- local builtin require('telescope.builtin').setup{
--   defaults = {
-- 	  file_ignore_patterns = {"node_modules"}
--   },
-- }
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- --

-- VIM DIRECTIVES
-- Set colorscheme
vim.cmd.colorscheme("tokyonight")
-- init.lua:
local set = vim.opt
set.termguicolors = true
set.encoding = "utf-8"
set.list = true
set.listchars = { space = " ", tab = "┊ " }
set.cursorline = true
set.mouse = "a"
set.number = true
set.errorbells = false
set.undofile = true
set.tabstop = 4
set.softtabstop = 4
set.sw = 4


-- vim legacy
-- second phase move these to lua native
vim.cmd([[
  set noerrorbells
  "set number
  "set tab characters to show
  "set list
  " set listchars=tab:\┊
  "set undofile
  "set fenc=utf-8
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline_solarized_bg='dark'
  let g:airline_powerline_fonts = 1
  let g:airline_theme='solarized'
  let g:airline_detect_modified=1
  le:ut g:airline#extensions#branch#enabled = 1
" remove the filetype part
  let g:airline_section_x=''
  " remove separators for empty sections
  let g:airline_skip_empty_sections = 1
  " tmuxline
  let g:tmuxline_preset = 'tmux'
  let g:tmuxline_powerline_separators = 0
  "" Stops the tmux powerline being overwritten
  let g:airline#extensions#tmuxline#enabled = 1
]])

-- Keep around in case I want to add list characters at any point

-- vim.opt.listchars = {
--  eol = '⤶',
--  space = ' ',
--  trail = '✚',
--  extends = '◀',
--  precedes = '▶',
--  tab = ' ┊',
--}
