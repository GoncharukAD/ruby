class CargoTrain < Train
  
  def initialize(number)
    @type = "cargo"
    super(number)
  end
end