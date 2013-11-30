#Dungeon class encompasses the entire text based game
class Dungeon
	
	#Attributes......................
	attr_accessor :player
	
	
	#Initialize.........................
	#takes only players name to create new player object & sets rooms to empty array
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
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
			@name + "\n\nYou are in " + @description
		end
	end

	#Methods.....................
	#NOTE: should we create reference to ensure no overlap?
	#ADD_ROOM - creates a new room and appends it to array of rooms in dungeon
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end
	
	#START - Initialize player location and display result to user
	def start(location)
		@player.location = location
		show_current_description
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
		find_room_in_dungeon(@player.location).connections[direction]
	end
	
end