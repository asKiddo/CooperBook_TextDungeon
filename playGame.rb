#Required files
load 'textDungeon.rb'

#Run a test game in size 2 dungeon
#Create game for Johnny Boy
my_dungeon = Dungeon.new("Johnny Boy", 2)

#Create some rooms
#my_dungeon.add_room(:library, "Library", "the room where we study or relax", {:west => :kitchen})
#my_dungeon.add_room(:kitchen, "Kitchen","the room of danger!",{:east => :library})

#Place player
my_dungeon.start(:kitchen)
my_dungeon.go(:east)

#Run a test game in size 4 dungeon
#Create game for Jane
my_dungeon2 = Dungeon.new("Jane", 4)

#Place player
my_dungeon2.start(:bedroom)
my_dungeon2.go(:south)
my_dungeon2.go(:west)