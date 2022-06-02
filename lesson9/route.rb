# frozen_string_literal: true

class Route
  include InstanceCounter
  include Acсessors
  include Validation

  NAME_FORMAT = /^[А-Я]{2,15}-+[А-Я]{2,15}$/i.freeze

  attr_reader :start, :finish, :stations, :name

  validate :num, :presence
  validate :num, :format, NAME_FORMAT
  validate :attribute_class, :type, 'Route'

  def initialize(start, finish, name)
    @start = start
    @finish = finish
    @name = name
    register_instance
    @stations = []
    validate!
    puts "Вы создали маршрут #{start} - #{finish}" if valid? == true
  end

  def route
    [@start, @stations, @finish].flatten.compact
  end

  def add_station(station_name)
    raise "Станция не относится к классу #{Station}" unless station_name.instance_of?(Station)

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
end
