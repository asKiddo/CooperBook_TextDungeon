#Dungeon class encompasses the entire text based game
class Dungeon
	
	#Attributes......................
	attr_accessor :player
	
	
	#Initialize.........................
	#takes only players name to create new player object & sets rooms to empty array, if dungeonSize is set to a number will create a default dungeon with given number of rooms
	def initialize(player_name, dungeonSize=0)
		@player = Player.new(player_name)
		@rooms = []
		default_dungeon(dungeonSize) if dungeonSize!=0
		puts "Hello " + player_name + ", welcome to the game!"
	end
	
	
	#Classes........................
	#Player class used as interaction between user and game
	class Player
		attr_accessor :name, :location
		
		def initialize(name)
			@name = name
		end
	end
	
	#room class is used to create single room objects which are stored in dungeon array to build game
	class Room
		attr_accessor :reference, :name, :description, :connections
		
		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end
	
		#FULL_DESCRIPTION - returns a full description of room
		def full_description
			@name.upcase + ": You are in " + @description
		end
	end

	#Methods.....................
#	#NOTE: should we create reference to ensure no overlap?
	#ADD_ROOM - creates a new room and appends it to array of rooms in dungeon
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end
	
	#START - Initialize player location and display result to user
	def start(location)
		if find_room_in_dungeon(location) != nil
			@player.location = location
			show_current_description
		else
			puts "That location does not exist in this dungeon, starting in #{@rooms[0].reference}"
			@player.location = @rooms[0].reference
		end
	end
	
	#SHOW_CURRENT_DESCRIPTION - displays description of room passed to user
	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end
	
	#FIND_ROOM_IN_DUNGEON - returns room object of passed reference
	def find_room_in_dungeon(reference)
		@rooms.detect { |room| room.reference == reference }
	end
	
	#GO - Move player in a direction and displays movement and result
	def go(direction)
		puts "You go " + direction.to_s
		@player.location = find_room_in_direction(direction)
		show_current_description
	end
	
	#FIND_ROOM_IN_DIRECTION - returns room reference from connections hash of current room moved in passed direction
	def find_room_in_direction(direction)
		if find_room_in_dungeon(@player.location).connections.has_key?(direction) 
			find_room_in_dungeon(@player.location).connections[direction]
		else
			puts "There is nothing in that direction"
			@player.location
		end
	end
	
	#LIST_ROOMS - displays list of rooms available in dungeon
	def list_rooms()
		@rooms.detect { |room| puts room.name }
	end
	
	#DEFAULT_DUNGEON - adds default rooms to dungeon during initialization
	def default_dungeon(size)
		#Default dungeon up to size 4
		case size
			when 1
				self.add_room(:library, "Library", "the room where we study or relax", {})
			when 2
				self.add_room(:library, "Library", "the room where we study or relax", {:west => :kitchen})
				self.add_room(:kitchen, "Kitchen","the room of danger!",{:east => :library})
			when 3
				self.add_room(:library, "Library", "the room where we study or relax", {:west => :kitchen, :north => :bedroom})
				self.add_room(:kitchen, "Kitchen", "the room of danger!",{:east => :library})
				self.add_room(:bedroom, "Bedroom", "the room of slumber", {:south => :library})
			when 4
				self.add_room(:library, "Library", "the room where we study or relax", {:west => :kitchen, :north => :bedroom})
				self.add_room(:kitchen, "Kitchen", "the room of danger!",{:east => :library, :north => :lavatory})
				self.add_room(:bedroom, "Bedroom", "the room of slumber", {:south => :library, :west => :lavatory})
				self.add_room(:lavatory, "Lavatory", "the unspeakable room", {:south => :kitchen, :east => :bedroom})
		end
	end
	
end