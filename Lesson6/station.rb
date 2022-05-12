class Station
  require_relative "instance_counter"
  include InstanceCounter
  attr_reader :name, :trains_list
  @@all_stations = []
  NAME_FORMAT = /^[a-я]{2,15}$/i

  def initialize(name)
    @name = name
    @trains_list = []
    @@all_stations.push(name)
    self.register_instance
    validate!
  end
  
  def all
    @@all_stations
  end
  
  def valid?
    validate!
    true
  rescue
    false  
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
  
  protected

  def validate!
    raise "Название станции не было введено" if name.nil?
    raise "Некорректный формат названия станции" if name !~ NAME_FORMAT
  end
end
