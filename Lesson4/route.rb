class Route
  attr_reader :start, :finish, :stations

  def initialize(start, finish)
    @start = start
    @finish = finish
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

#Тесты
msk_spb = Route.new("Moscow", "Sankt-Petesburg")
msk_spb.start
msk_spb.finish
msk_spb.stations
msk_spb.add_station("Pskov")
msk_spb.add_station("Tver")
msk_spb.remove_station("Tver")
msk_spb.route
