#Required files
load 'textDungeon.rb'

#Run a test game
#Create game for Johnny Boy
my_dungeon = Dungeon.new("Johnny Boy")

#Create some rooms
my_dungeon.add_room(:library, "Library", "the room where we study or relax", {:west => :kitchen})
my_dungeon.add_room(:kitchen, "Kitchen","the room of danger!",{:east => :library})

#Place player
my_dungeon.start(:kitchen)
my_dungeon.go(:east)