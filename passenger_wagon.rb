class PassengerWagon < Wagon

  @@count_instances = 0

  def initialize(number)
    self.register_instance
    super
    @type = "passenger"
  end
end 
