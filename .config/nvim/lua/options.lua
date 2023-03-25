local options = {
	--LINE NUMBERS
	number = true,
	relativenumber = true,

	title = true,
	scrolloff = 8,
	mouse = "a",
	cursorline = true,
	numberwidth = 4,
	fileencoding = "utf-8",
	signcolumn = "yes",
	cmdheight = 1,
	splitbelow = true,
	splitright = true,
	clipboard = "unnamedplus",
	termguicolors = true,
	updatetime = 2000,

	-- TABS & INDENTATION
	smartindent = true,
	shiftwidth = 2,
	expandtab = true,
	autoindent = true,

	--SEARCH
	ignorecase = true,
	smartcase = true,
	hlsearch = false,

	--REMOVE SOUND
	visualbell = true,
	errorbells = false,

	wrap = false
}

for key, value in pairs(options) do
		vim.opt[key] = value
end

























