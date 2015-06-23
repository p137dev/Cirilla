$turn_counter = 0

class Cirilla
	include Cinch::Plugin
	
	match /log (.+)/, method: :log
	match /set_gm (.+)/, method: :set_gm
	match "brief", method: :brief
	match /add_eq (.+) (.+)/, method: :add_eq
	match /rm_eq (.+) (.+)/, method: :rm_eq
	match /list_eq (.+)/, method: :list_eq
	match "next_turn", method: :next_turn
	
	@gm = String.new
	
	def log(m, line)
		logfile = File.open('temp-rpg.log', 'a')
		logfile << "#{Time.now}, #{m.user.nick}, #{line}, #{m.channel}"
		logfile << "\n"
		logfile.close
	end
	
	def set_gm(m, gm)
		unless @gm
			@gm = gm
			m.reply "Attention! Your current GM set to: #{gm}."
		else
			if m.channel.opped?(m.user) or m.user == @gm
				m.reply "#{m.user.nick} changed the current GM from #{@gm} to #{gm}."
				@gm = gm
			else
				m.reply "GM already selected. Only a channel operator can override that."
			end
		end
		
	end
	
	def brief(m)
		if m.user.nick == @gm
			logfile = File.open('temp-rpg.log', 'r')
			logfile.each_line do |line|
				temp_array = line.chomp.split(", ")
				temp_array[3] = "a separate channel" unless temp_array[3]
				m.reply "#{temp_array[0]}: #{temp_array[1]} said '#{temp_array[2]}' on #{temp_array[3]}"
			end
			logfile.close
		end
	end
	
	def add_eq(m, player, thing)
		if m.user.nick == @gm
			player_sheet = File.open("#{player}_eq.sav", 'a')
			player_sheet << "#{thing} "
			player_sheet.close
			m.reply "Added #{thing} to #{player}'s inventory."
		end
	end
	
	def rm_eq(m, player, thing)
		if m.user.nick == @gm
			item_array = IO.readlines("#{player}_eq.sav")
			item_array = item_array[0].split(" ")
			if item_array.include? thing
				item_array.delete(thing)
			end
			player_sheet = File.open("#{player}_eq.sav", 'w+')
			player_sheet << item_array.join(" ").to_s
			item_array.clear
			player_sheet.close
			m.reply "Removed #{thing} from #{player}'s inventory."
		end
	end
	
	def list_eq(m, player)
		player_sheet = File.open("#{player}_eq.sav", 'r')
		player_sheet.each_line do |line|
			m.reply "#{m.user.nick}: #{line}"
		end
		player_sheet.close
	end
	
	def next_turn(m)
		if m.user.name == @gm
			File.delete('temp-rpg.log')
			$turn_counter += 1
			m.reply "CAUTION! It is now turn #{$turn_counter}."
		end
	end
	
end

