class Wagon
  attr_reader :type, :number

  def initialize(number)
    @number = number
    @type = Nil
  end
end

class CargoWagon < Wagon

  def initialize(number)
    super
    @type = "cargo" 
  end
end

class PassengerWagon < Wagon

  def initialize(number)
    super
    @type = "passenger"
  end
end 
