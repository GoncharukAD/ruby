class Train
   
  attr_reader :wagons, :speed, :type, :route, :number
 
  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
    @route = []

  end 
  
  def acselerate(speed)
   @speed += speed if speed > 0
  end

  def acselerate(speed)
    @speed += speed if speed > 0
   end

 
  def stop
   @speed = 0
  end
  
  def slowdown(speed)
    @speed -= speed  if @speed > 0 || speed > 0 
  end  
  
 def route_set(station_name)
   @route =  station_name
   @station_index  = 0
   #При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  end 


  def move_forward
    station_index = @route.stations.find_index(@current_station)
    current_station.depart(self)
  end 
  #Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def current_station
   @route.[station_index]
  end  
 
  def next_station
   @route.route[@station_index + 1]
  end
  
  def prev_station
   return if @station_index < 1
   @route.route[@station_index - 1]
  end
  
 
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