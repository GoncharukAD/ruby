class Route
  include InstanceCounter
  attr_reader :start, :finish, :stations, :name

  def initialize(start, finish, name)
    self.register_instance
    @start = start
    @finish = finish
    @name = name
    @stations = []
  end

  def route
    [@start, @stations, @finish].flatten.compact
  end

  def add_station(station_name)
    stations.push(station_name)
  end
  
  def remove_station(station_name)
    stations.delete(station_name)
  end      
end

