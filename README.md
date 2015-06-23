# Cirilla

### Description
Cirilla is a plugin for the Ruby Cinch IRC framework for conducting short one-shot IRC RPG sessions.

### Setting up
You need to have Ruby installed in your system. If you're running some GNU/Linux it is very likely that you already have it.
You also need the Cinch gem. You can install it by running:

`gem install cinch`

Now you have to clone the repository wherever you want. The command for this is:

`git clone https://github.com/p137dev/cirilla.git`

The *samplebot.rb* file contains configuration. Change the bot's name and channel there. Additional (advanced) configuration for this file can be found [here](https://github.com/cinchrb/cinch/blob/master/docs/bot_options.md).

The *Cirilla.rb* file is the core plugin.

### Using the plugin / commands

**All of the following commands must be preceded by a symbol. The default symbol is ":" (a colon), but you can change it in the samplebot.rb file.**

Cirilla has the following commands:

`set_gm <user_nick>`: sets the GM (game master) to a specified person. Once this is done, the only person who can transfer GM rights to another person is the GM himself or a channel operator. GM rights are required to execute most of the commands.

`log <line>`: there may be chatter on the IRC channel (and it's good!), but none of it is logged until someone uses that command. If a player decides on a action, they use this command to log the action. It's timestamped to prevent time paradoxes :)

`brief`: a command to be used by a GM on a query with a bot (`/msg <botname> :brief`). Returns all the logged lines for GM's consideration. 

`add_eq <player> <thing>`: GM command. Adds a thing to player's inventory.

`rm_eq <player> <thing>`: An opposite GM command. Removes a thing from player's inventory. Simple.

`list_eq <player>`: Lists the player's EQ. Any player can use it.

`next_turn`: GM command. Deletes the action log and increments the turn counter.

### Additional notes

Have fun!


