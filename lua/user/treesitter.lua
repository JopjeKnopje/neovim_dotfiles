local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = "c",
	sync_install = false,
	ignore_install = { "haskell" },
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of languages that will be disabled
		additional_vim_regex_highlighting = true,
	},
	-- auto indent on the right tab level
	indent = { 
		enable = false,
		disable =  { "yaml" }

	}
}
