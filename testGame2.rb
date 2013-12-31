#Required files
load 'textDungeon.rb'

#Generate dungeon
sz = 4
puts "Generating dungeon of size #{sz}..."
my_dungeon = Dungeon.new("Sally",sz)

#List room initialization options
puts "\nYou may start the game in:"
my_dungeon.list_rooms()

#Start in bedroom
puts "\nStarting the game in the bedroom..."
my_dungeon.start(:bedroom)

#Go south
puts "\nYou decide to venture South..."
my_dungeon.go(:south)