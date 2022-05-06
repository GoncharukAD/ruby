class CargoWagon < Wagon
  @@count_instances = 0

  def initialize(number)
    self.register_instance
    super
    @type = "cargo" 
  end
end