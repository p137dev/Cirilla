require 'cinch'
require './Cirilla.rb'

rpgwaifu = Cinch::Bot.new do
	configure do |cfg|
		cfg.nick = "cirilla"
		cfg.realname = "Cirilla"
		cfg.user = "cirilla"
		cfg.server = "irc.freenode.net"
		cfg.channels = ["cirilla-rpg"]
		cfg.plugins.plugins = [Cirilla]
		cfg.plugins.prefix = ":"
		cfg.messages_per_second = "0.8"
	end
end


rpgwaifu.start