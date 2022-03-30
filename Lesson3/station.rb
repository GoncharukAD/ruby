class Station
  attr_reader :name, :trains_list

  def initialize(name)
   @name = name
   @trains_list = {}
  end

  def arrive(train) #train - Объект класса Train
   @train = train
   type = @train.number
   number = @train.type
   @trains_list[number] = type
  end
 

  def trains_select(type)
    trains_list.select {|number, type_train| type_train == type}
   end  

  def depart(train) 
   trains_list.delete(train)
  end 
end
