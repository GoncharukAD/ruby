class Station
 attr_reader :name :trains

 def initialize(name)
  @name = name
  @trains = {}
 end

 def arrive(number, type) #number - номер поезда(как имя), type - тип
  @type = type
  @number = number
  @trains[number] = type
 end
 

 def trains_select(type)
  puts trains.select {|number, type_train| type_train == type}
 end 

 def depart(number) # отправка поезда
  trains.delete(number)
 end 
end



class Route
  attr_reader :start :finish :points

  def initialize(start, finish)
   @start = start
   @finish = finish
   @points = []
  end

  def route
    [@start, @points, @finish].flatten.compact
  end

  def add_station(station_name)
    points.push(station_name)
  end
  
  def remove_station(station_name)
   route.delete(station_name)
  end
      
end

class Train
 attr_reader :wagons :speed :type

 def initialize(number, type, wagons)
   @number = number
   @type = type
   @wagons = wagons
   @speed = 0
   @route = Nil
   @station_index = 0
  end 
 

 def go(speed)
  @speed = speed
 end

 def stop
  @speed = 0
 end 
 
 def current_route

 

 def add_wagons(number)
  if @speed == 0
   @wagons += number
  else
    puts "Please stop train before adding wagons"
  end   
 end 
 
 def remove_wagons(number)
  if @speed == 0 && wagons > 0
    @wagons -= number
  else
     puts "Please stop train and check the availability of wagons"
  end
 end
  
end  

    