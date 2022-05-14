class Train
  require_relative "manufacturer_name"
  require_relative "instance_counter"
  include ManufacturerName
  include InstanceCounter
  
  @@all_trains = {}
  NUMBER_FORMAT = /^[а-я]{3}|\d{3}-*[а-я]|\d{2}$/i

  attr_reader :speed, :type, :route, :number, :current_station, :wagons
 
  def initialize(number)
    @number = number
    @speed = 0
    @type = nil
    @route = nil
    wagons = []
    self.register_instance
    @@all_trains[number] = self
    valid?
    #puts "Вы создали поезд номер #{train_number} if valid? == true "Пока не использовать,т.к. не знаю,как сделать так,чтобы писало только тогда,когда поезд создан 
  end 
  
  def acselerate(speed)
    @speed += speed if speed > 0
  end

  def valid?
    validate!
    true
  rescue
    false  
  end    

 
  def stop
    @speed = 0
  end

  def self.find(number)
    @@all_trains[number]
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
    return unless @current_station == @route.finish 
    @current_station = @route.stations.find_index(@station_index + 1)
  end    

  def move_back
    return unless @current_station == @route.start   
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
    if @speed == 0 && @type == wagon.type
      wagons.push(wagon)
    else
      puts "Пожалуйста,остановите поезд перед добавлением вагонов и проверьте тип вагона"
    end   
  end 
  
  def remove_wagons(wagon)
    if @speed == 0 && wagons.empty? == false 
      wagons.delete(wagon)
      puts "Пожалуйста,остановите поезд и проверьте наличие вагонов"
    end
  end

  protected

  def validate!
    raise "Номер поезда не был введен" if number.nil?
    raise "Некорректный формат номера поезда" if number !~ NUMBER_FORMAT
  rescue StandardError => e
    puts "Ошибка: #{e.message}"
    puts "Введите корректные данные"
  end
end
 
 