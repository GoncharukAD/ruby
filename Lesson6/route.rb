class Route
  include InstanceCounter
  NAME_FORMAT = /^[А-Я]{2,15}-+[А-Я]{2,15}$/i

  attr_reader :start, :finish, :stations, :name

  def initialize(start, finish, name)
    @start = start
    @finish = finish
    @name = name
    self.register_instance
    @stations = []
    valid?
    #puts "Вы создали маршрут #{route_start} - #{route_finish}" Пока не использовать,т.к. не знаю,как сделать так,чтобы писало только тогда,когда маршрут создан
  end

  def valid?
    validate!
    true
  rescue
    false  
  end 

  def route
    [@start, @stations, @finish].flatten.compact
  end

  def add_station(station_name)
    raise "Станция не относится к классу #{Station}" unless station_name.class == Station
    stations.push(station_name)
  end
  
  def remove_station(station_name)
    if stations.include?
      stations.delete(station_name)
      puts "Станция #{station_name} удалена из маршрута"
    else  
      puts "Cтанции #{station_name} нет в маршруте"
    end    
  end 
  
  protected

  def validate!
    raise "Начальная станция маршрута не была введена" if start.nil?
    raise "Конечная станция маршрута не была введена" if finish.nil?
    raise "Название маршрута не было введено" if name.nil?
    raise "Некорректный формат названия маршрута" if name !~ NAME_FORMAT
  rescue StandardError => e
    puts "Ошибка: #{e.message}"
    puts "Введите корректные данные"
  end
end

