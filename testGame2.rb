#Required files
load 'textDungeon.rb'

#Generate dungeon from user prompts
#Prompt for name
print "Enter player name: "
uName = gets.chomp
print "Enter dungeon size (0-4): "
sz = Integer(gets.chomp)
while (sz > 4) || (sz < 0) do
	puts "ERROR: INVALID SIZE ENTRY"
	print "Enter dungeon size (0-4): "
	sz = Integer(gets.chomp)
end
puts "Generating dungeon of size #{sz}..."
my_dungeon = Dungeon.new(uName,sz)

#List room initialization options
puts "\nYou may start the game in:"
my_dungeon.list_rooms()

#Start in bedroom
puts "\nStarting the game in the bedroom..."
my_dungeon.start(:bedroom)

#Go south
puts "\nYou decide to venture South..."
my_dungeon.go(:south)

#Go south
puts "\nIt was so succesful you try it again..."
my_dungeon.go(:south)