local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

npairs.setup {
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", " ", "'", '"' },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		end_key = '$',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
}

--local cmp_autopairs = require "nvim-autopairs.completion.cmp"
--local cmp_status_ok, cmp = pcall(require, "cmp")
--if not cmp_status_ok then
--    return
--end

