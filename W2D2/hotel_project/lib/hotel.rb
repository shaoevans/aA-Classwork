require_relative "room"

class Hotel
    attr_reader :rooms

  def initialize(name, hash)
    @name = name
    @rooms = Hash.new(0)
    hash.each {|k, v| @rooms[k] = Room.new(v)}
  end

  def name
    @name.split(" ")
         .map {|word| word.capitalize}
         .join(" ")
  end

  def room_exists?(str)
    @rooms.include?(str)
  end

  def check_in(person, room)
    if !self.room_exists?(room)
        puts "sorry, room does not exist"
    elsif @rooms[room].add_occupant(person)
        puts "check in successful"
    else
        puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.values
        .each
        .map { |ele| ele.full? }
        .any? { |ele| ele == false }
  end

  def list_rooms
    @rooms.each do |name, room|
        print name
        puts room.available_space
    end
  end

end
