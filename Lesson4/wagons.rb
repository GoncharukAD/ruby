class Wagon
  def initialize(number)
    @number = number
    @type = Nil
  end
end

class CargoWagon(number)
  def initialize(number)
    super
    @type = "cargo" 
  end
end

class PassengerWagon(number)
  def initialize(number)
    super
    @type = "passenger"
  end
end 
