class Wagon
  include ManufacturerName
  include InstanceCounter

  attr_reader :type, :number

  NUMBER_FORMAT = /^[а-я]{2}\d{3}$/i

  def initialize(number)
    @number = number
    @type = nil
    self.register_instance
    valid?
    puts "Вы создали вагон номер #{number}" if valid? == true
  end

  def valid?
    validate!
    true
  rescue StandardError => e
    puts "Ошибка: #{e.message}"
    puts "Введите корректные данные"
    false  
  end 

  protected

  def validate!
    raise "Номер вагона не был введен" if number.nil?
    raise "Некорректный формат номера вагона" if number !~ NUMBER_FORMAT
  end
end