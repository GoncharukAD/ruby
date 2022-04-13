class Train
  attr_reader :speed, :type, :route, :number, :current_station
 
  def initialize(number)
    @number = number
    @speed = 0
    @type = Nil
    wagons = []
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
    return @speed = 0 if speed > @speed
  end  
  
  def route_set(route)  
    @route =  route
    @station_index  = 0
    @current_station = @route.route[@station_index]
  end 

  def move_forward
    return unless @current_station == @route.finish #Если текущая станция не конечная в нашем маршруте
    @current_station = @route.stations.find_index(@station_index + 1)
  end    

  def move_back
    return unless @current_station == @route.start   #Если текущая станция не стартовая в нашем маршруте
    @current_station = @route.stations.find_index(@station_index - 1)
  end
 
  def next_station
    @route.route[@station_index + 1]
  end
  
  def prev_station
    return if @station_index < 1
    @route.route[@station_index - 1]
  end
  
  def add_wagons(wagon)
    if @speed == 0
      wagons.push(wagon)
    else
      puts "Пожалуйста,остановите поезд перед добавлением вагонов"
    end   
  end 
  
  def remove_wagons(wagon)
    if @speed == 0 && wagons.empty? == false
      wagons.delete(wagon)
      puts "Пожалуйста,остановите поезд и проверьте наличие вагонов"
    end
  end
end
 
class PassengerTrain < Train
  def initialize(number)
    super
    @type = "passenger"
  end

  def add_wagons(wagon)
    if wagon.type == "passenger"
      super
    else
      puts "Невозможно добавить вагон этого типа к данному поезду"
    end      
  end

  def remove_wagons(wagon)
    if wagon.type == "cargo"
      super
    else
      puts "Невозможно добавить вагон этого типа к данному поезду"
    end      
  end
end
  
class CargoTrain < Train
  def initialize(number)
    super
    @type = "cargo"
  end

  def add_wagons(wagon)
    if wagon.type == "cargo"
      super
    else
      puts "Невозможно добавить вагон этого типа к данному поезду"
    end      
  end

  def remove_wagons(wagon)
    if wagon.type == "cargo"
      super
    else
      puts "Невозможно добавить вагон этого типа к данному поезду"
    end      
  end
end 