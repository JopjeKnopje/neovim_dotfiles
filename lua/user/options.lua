local options = {
    backup = false,					-- creates a backup file
    clipboard = "unnamedplus",				-- allows neovim to use system clipboard
    cmdheight = 2,					-- more space in the neovim command line for messages
    completeopt = { "menuone", "noselect" },		-- autocomplete settings
    fileencoding = "utf-8",				-- the encoding written to a file
    hlsearch = true,					-- highlight all matches on previous search pattern
    ignorecase = true,					-- ignore case in search patterns
    mouse = "a",					-- disable mouse in neovim
    pumheight = 10,					-- pop up menu height
    showmode = false,					-- hide the INSERT VISUAL REPLACE stuff
    smartcase = true,					-- smart case
    smartindent = true,					-- smart indent
    splitbelow = true,					-- force all horizontalsplits to go below current window
    splitright = true,					-- force all vertical splits to go right from the current window
    swapfile = false,					-- creates a swapfile
    termguicolors = true,				-- set term gui colors	
    timeoutlen = 1000,					-- time to wait for a mapped seqeunce to complete {in ms}
    undofile = true,					-- enable presistend undo
    updatetime = 300,					-- faster completion 
    writebackup = false,				-- if a file is being written to by another program
    expandtab = false,				-- convert tabs to spaces
    tabstop = 4,					-- insert 4 spaces for each tab
    shiftwidth = 4,					-- number of spaces for each indentation 
    -- cursorline = true,				-- hightlight the current line
    number = true,					-- enable line numbers
    relativenumber = true,				-- relative line numbers
    numberwidth = 2,					-- set number width to 2 {default is 4}
    signcolumn = "yes",				-- idk?
    wrap = false,					-- disable line wrapping
    scrolloff = 8,					-- scroll offset very cool
    sidescrolloff = 8,
	cursorline = true,
}


-- disable auto inserting comments on newline
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

for k, v in pairs(options) do
    vim.opt[k] = v
end
