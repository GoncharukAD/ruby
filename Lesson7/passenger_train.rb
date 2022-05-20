class PassengerTrain < Train

  def initialize(number)
    @type = "passenger"
    super(number)
  end
end