class Station
  attr_reader :name, :trains_list

  def initialize(name)
    @name = name
    @trains_list = []
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
