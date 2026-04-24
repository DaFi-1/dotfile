--##############################################################################
--#                  ▗▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▄▖ ▗▄▄▖                            #
--#                 ▐▌   ▐▌ ▐▌▐▛▚▖▐▌▐▌     █  ▐▌                               #
--#                 ▐▌   ▐▌ ▐▌▐▌ ▝▜▌▐▛▀▀▘  █  ▐▌▝▜▌                            #
--#                 ▝▚▄▄▖▝▚▄▞▘▐▌  ▐▌▐▌   ▗▄█▄▖▝▚▄▞▘                            #
--#                                                                            #
--##############################################################################
vim.cmd("autocmd FileType html source ~/.config/nvim/iabrev/html.vim")
vim.cmd("autocmd FileType c source ~/.config/nvim/iabrev/c.vim")
vim.cmd("autocmd FileType css source ~/.config/nvim/iabrev/css.vim")
vim.cmd("autocmd FileType python source ~/.config/nvim/iabrev/py.vim")
vim.cmd("autocmd FileType sql source ~/.config/nvim/iabrev/sql.vim")

vim.cmd([[
function! Main(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction
iabbrev q <bs>=<c-r>=Main('\s')<cr>
iabbrev qe ==<c-r><cr>
iabbrev ne !=<c-r><cr>
iabbrev lt <<c-r><cr>
iabbrev gt ><c-r><cr>
iabbrev ge >=<c-r><cr>
iabbrev le <=<c-r><cr>
iabbrev <expr> i "\+"
iabbrev <expr> l "\-"
iabbrev <expr> ii "\<BS>++"
iabbrev <expr> ll "\<BS>--"
iabbrev p <bs> *<c-r>=Main('\s')<cr>
iabbrev c <bs> $<c-r>=Main('\s')<cr>
iabbrev e <bs> &<c-r>=Main('\s')<cr>
iabbrev pe <bs> %<c-r>=Main('\s')<cr>
iabbrev g <bs>:<c-r>=Main('\s')<cr>
iabbrev as <bs>\<c-r>=Main('\s')<cr> 
iabbrev f <bs>()<left><c-r>=Main('\s')<cr>
iabbrev d <bs>{}<left><c-r>=Main('\s')<cr>
iabbrev s <bs>''<left><c-r>=Main('\s')<cr>
iabbrev ss <bs>""<left><c-r>=Main('\s')<cr>
iabbrev a <bs>[]<left><c-r>=Main('\s')<cr>
iabbrev ass <bs><><left><c-r>=Main('\s')<cr>
iabbrev b <bs>_<c-r>=Main('\s')<cr>
iabbrev bb ____<left><left><c-r>=Main('\s')<cr>
iabbrev dj {% @ %}<esc><Home>f@s<c-r>=Main('\s')<cr>
autocmd FileType c,cpp,h iabbrev <buffer> and &&
autocmd FileType c,cpp,h iabbrev <buffer> or \|
autocmd FileType c,cpp,h iabbrev <buffer> not !
]])
vim.g.mapleader = " "
vim.keymap.set("n", "<space>b", "<cmd>vsplit | Ex<CR>", { silent = true })
vim.keymap.set("n", "<space>v", "<cmd>split | Ex<CR>", { silent = true })
vim.keymap.set("n", "<space>t", "<cmd>tabnew | tabmove 0 | terminal<CR>", { silent = true })
vim.keymap.set("n", "<space>q", "<cmd>wq<CR>", { silent = true })
vim.keymap.set("n", "<space>e", "<cmd>FzyFilesTab<CR>", { silent = true })
vim.keymap.set("n", "<space>f", "/", { silent = false })
vim.keymap.set("n", "<Esc>", function()
  -- Verifica se é um buffer normal e modificado (não readonly, não terminal, etc.)
  if vim.bo.buftype == "" and vim.bo.modified and not vim.bo.readonly then
    vim.cmd("w")
  end
end, { silent = true })



local group = vim.api.nvim_create_augroup("CursorLineFocus", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
  group = group,
  callback = function(ev)
    vim.opt_local.cursorline = ev.event == "WinEnter"
  end,
})
vim.api.nvim_create_autocmd("VimResized", {pattern = "*",command = "wincmd ="})
vim.cmd("filetype on")
vim.cmd("filetype plugin on")

vim.opt.history         = 1000
vim.opt.undolevels      = 1000
vim.opt.swapfile        = false
vim.opt.backup          = false
vim.opt.writebackup     = false
vim.opt.hlsearch        = true
vim.opt.incsearch       = true
vim.opt.ignorecase      = true
vim.opt.smartcase       = true
vim.opt.termguicolors   = true
vim.opt.signcolumn      = "yes"
vim.opt.pumheight       = 10
vim.opt.laststatus      = 2
vim.opt.showmode        = false
vim.opt.number          = false
vim.opt.mouse           = "a"
vim.opt.scrolloff       = 99
vim.opt.wrap            = false
vim.opt.clipboard       = "unnamedplus"
vim.opt.expandtab       = true
vim.opt.tabstop         = 4
vim.opt.softtabstop     = 4
vim.opt.shiftwidth      = 4
vim.opt.splitright      = true
vim.opt.splitbelow      = true
vim.opt.foldmethod      = "indent"
vim.opt.foldlevel       = 99
vim.opt.fillchars       = { vert = "│", eob = " " }
vim.o.updatetime        = 50
vim.o.redrawtime        = 90
vim.o.completeopt       = "menuone,noselect"
vim.o.ttimeoutlen       = 0
vim.g.netrw_banner      = 0
vim.g.netrw_liststyle   = 3
vim.g.netrw_keepdir     = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- install with yarn or npm
	{
	  "iamcco/markdown-preview.nvim",
	  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	  build = "cd app && yarn install",
	  init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_browser = "qutebrowser"
	  end,
	  ft = { "markdown" },
	},
      {"MunifTanjim/nui.nvim"},
      {"DaFi-1/bolinhax"},
      {"DaFi-1/winhopxx"},
      {"DaFi-1/tabindex"},
      {"DaFi-1/tasknvim"},
--    {"folke/noice.nvim",event = "VeryLazy",opts = {},},
--{
--  "lewis6991/gitsigns.nvim",
--  opts = {
--    signs = {
--      add          = { text = '', texthl = "GitSignsAdd", linehl = "GitSignsAddLn", numhl = "GitSignsAddNr" },
--      change       = { text = '', texthl = "GitSignsChange", linehl = "GitSignsChangeLn", numhl = "GitSignsChangeNr" },
--      delete       = { text = '', texthl = "GitSignsDelete", linehl = "GitSignsDeleteLn", numhl = "GitSignsDeleteNr" },
--      topdelete    = { text = '‾', texthl = "GitSignsDelete", linehl = "GitSignsDeleteLn", numhl = "GitSignsDeleteNr" },
--      changedelete = { text = '~', texthl = "GitSignsChangeDelete", linehl = "GitSignsChangeDeleteLn", numhl = "GitSignsChangeDeleteNr" },
--      untracked    = { text = '┆', texthl = "GitSignsAdd", linehl = "GitSignsAddLn", numhl = "GitSignsAddNr" },
--    },
--    signs_staged = {
--      add          = { text = '┃', texthl = "GitSignsAdd", linehl = "GitSignsAddLn", numhl = "GitSignsAddNr" },
--      change       = { text = '┃', texthl = "GitSignsChange", linehl = "GitSignsChangeLn", numhl = "GitSignsChangeNr" },
--      delete       = { text = '_', texthl = "GitSignsDelete", linehl = "GitSignsDeleteLn", numhl = "GitSignsDeleteNr" },
--      topdelete    = { text = '‾', texthl = "GitSignsDelete", linehl = "GitSignsDeleteLn", numhl = "GitSignsDeleteNr" },
--      changedelete = { text = '~', texthl = "GitSignsChangeDelete", linehl = "GitSignsChangeDeleteLn", numhl = "GitSignsChangeDeleteNr" },
--      untracked    = { text = '┆', texthl = "GitSignsAdd", linehl = "GitSignsAddLn", numhl = "GitSignsAddNr" },
--    },
--    signs_staged_enable = true,
--
--    -- Configurações para melhorar performance
--    signcolumn = true,
--    numhl      = true,
--    linehl     = true,
--    word_diff  = false,            -- word_diff é custoso, desabilitar se não precisar
--    max_file_length = 20000,       -- reduzir para arquivos muito grandes
--    update_debounce = 200,         -- aumenta debounce para reduzir atualizações frequentes
--    status_formatter = nil,        -- desabilitar formatação custom se não usar
--    attach_to_untracked = true,
--    auto_attach = true,
--    watch_gitdir = { follow_files = true },
--
--    current_line_blame = true,
--    current_line_blame_opts = {
--      virt_text = true,
--      virt_text_pos = 'eol',
--      delay = 500,                 -- aumenta delay para reduzir updates constantes
--      ignore_whitespace = false,
--      virt_text_priority = 100,
--      use_focus = true,
--    },
--    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
--
--    preview_config = {
--      style = 'minimal',
--      relative = 'cursor',
--      row = 0,
--      col = 1,
--      border = 'single',
--    },
--
--    vim.api.nvim_set_keymap('n', ';', "<cmd>lua require('gitsigns').preview_hunk()<CR>", { noremap = true, silent = true }),
--    on_attach = function(bufnr)
--      -- Cria highlights uma vez para todo buffer
--      vim.api.nvim_set_hl(0, 'GitSignsAddLn', { bg = '#003300' })
--      vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { bg = '#333300' })
--      vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { bg = '#330000' })
--      vim.api.nvim_set_hl(0, 'GitSignsChangeDeleteLn', { bg = '#333333' })
--    end,
--  }
--},



    {
        "lervag/vimtex",
        ft = "tex",  -- carrega só em arquivos .tex
        config = function()
            vim.g.vimtex_compiler_method = 'tectonic'
            vim.g.vimtex_view_method = 'zathura'  -- ou 'skim', 'mupdf', 'sioyek', etc.
        end
    },

})
--##############################################################################
--#  ▗▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▄▖ ▗▄▄▖    ▗▄▄▖ ▗▖   ▗▖ ▗▖ ▗▄▄▖▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖    #
--# ▐▌   ▐▌ ▐▌▐▛▚▖▐▌▐▌     █  ▐▌       ▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌     █  ▐▛▚▖▐▌▐▌       #
--# ▐▌   ▐▌ ▐▌▐▌ ▝▜▌▐▛▀▀▘  █  ▐▌▝▜▌    ▐▛▀▘ ▐▌   ▐▌ ▐▌▐▌▝▜▌  █  ▐▌ ▝▜▌ ▝▀▚▖    #
--# ▝▚▄▄▖▝▚▄▞▘▐▌  ▐▌▐▌   ▗▄█▄▖▝▚▄▞▘    ▐▌   ▐▙▄▄▖▝▚▄▞▘▝▚▄▞▘▗▄█▄▖▐▌  ▐▌▗▄▄▞▘    #
--#                                                                            #
--##############################################################################
--###############
--# COLORSCHEME #
--###############
require("bolinhax").setup()

--###############
--# ?????       #
--###############
vim.g.vimtex_compiler_method = "tectonic"
vim.g.vimtex_compiler_autostart = 1
vim.g.vimtex_compiler_continuous = 1

--##########################
--# Close netrw with key Q #
--##########################
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "q", ":close<CR>", { noremap = true, silent = true })
    end
})
--#############################
--#  Split terminal and files #
--#############################
local function smart_split(direction)
    local buf_type = vim.bo.buftype  -- pega o tipo do buffer atual
    if buf_type == "terminal" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), 'n', false)
        if direction == "vertical" then
            vim.cmd("vsplit")
        else
            vim.cmd("split")
        end
        vim.cmd("terminal")
   --     vim.cmd("startinsert")
    else
        -- não é terminal → abre Ex no split
        if direction == "vertical" then
            vim.cmd("vsplit | Ex")
        else
            vim.cmd("split | Ex")
        end
    end
end
vim.keymap.set("n", "<space>b", function() smart_split("vertical")   end, { silent = true })
vim.keymap.set("n", "<space>v", function() smart_split("horizontal") end, { silent = true })
vim.keymap.set("t", "<space>b", function() smart_split("vertical")   end, { silent = true })
vim.keymap.set("t", "<space>v", function() smart_split("horizontal") end, { silent = true })
vim.keymap.set("t", "<Esc>"   , "<C-\\><C-n>",{ silent = true })

--################
--# AUTOCOMPLETE #
--################
local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"
for i = 1, #chars do
  local c = chars:sub(i, i)
  vim.api.nvim_set_keymap("i", c, c .. "<C-n><C-p>", { noremap = true, silent = true })
end
-- Enter confirma autocomplete sem pular linha se menu estiver aberto
vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? "<C-y>" : "<CR>"', { expr = true, noremap = true })


---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
--PLUGIN DE NAVEGAER ENTRE ABAS COM TECLA DE COMANDO
-- SCPACE + e
vim.g.mapleader = " "
local letters = "abcdefghijklmnopqrstuvwxyz"
function _G.goto_tab_by_letter()
  local tabs = vim.api.nvim_list_tabpages()
  -- mostra letras nas abas (eco simples)
  local msg = ""
  for i, tab in ipairs(tabs) do
    local letter = letters:sub(i, i)
    if letter == "" then break end

    local win = vim.api.nvim_tabpage_get_win(tab)
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")

    msg = msg .. letter .. ":" .. (name ~= "" and name or "[No Name]") .. "  "
  end
  vim.api.nvim_echo({{msg, "Normal"}}, false, {})
  -- captura UMA tecla
  local char = vim.fn.getcharstr()
  local index = letters:find(char)
  if index and tabs[index] then
    vim.api.nvim_set_current_tabpage(tabs[index])
  end
end
-- keymap
vim.keymap.set("n", "<leader>e", _G.goto_tab_by_letter, { noremap = true, silent = true })





