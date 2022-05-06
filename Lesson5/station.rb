class Station
  include InstanceCounter
  attr_reader :name, :trains_list
  @@all_stations = []
  @@count_instances = 0

  def initialize(name)
    @name = name
    @trains_list = []
    @@all_stations.push(name)
    self.register_instance
  end
  
  def all
    @@all_stations
  end  

  def arrive(train) #train - Объект класса Train
    @train_list.push(train)
  end

  def trains_select(type)
    @trains_list.select {|train|  train.type == type}
  end  

  def depart(train) 
    trains_list.delete(train)
  end 
end
