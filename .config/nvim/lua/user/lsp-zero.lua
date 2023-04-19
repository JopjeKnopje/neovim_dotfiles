local lsp = require('lsp-zero')

lsp.preset('recommended')


local MY_FQBN = "arduino:avr:leonardo"

lsp.configure('arduino_language_server', {
    cmd = {
		"arduino-language-server",
		"-cli-config", "/home/joppe/.arduino15/arduino-cli.yaml",
		"-clangd", "/usr/bin/clangd",
		"-cli", "/home/joppe/.local/bin/arduino-cli",
		"-fqbn", MY_FQBN
	}


})


lsp.setup()

