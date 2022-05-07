class Wagon
  include ManufacturerName
  include InstanceCounter

  attr_reader :type, :number

  def initialize(number)
    self.register_instance
    @number = number
    @type = nil
  end
end
