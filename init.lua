require "my.plugins"
require("plenary.reload").reload_module("my")

require "my.themes"

require "my.commands"
require "my.options"
require "my.keybindings"
require "my.language_support" --depends keybindings
