class Wagon
  include ManufacturerName
  include InstanceCounter

  attr_reader :type, :number

  NUMBER_FORMAT = /^[а-я]{2}\d{3}$/i

  def initialize(number)
    @number = number
    @type = nil
    self.register_instance
    validate!
    #puts "Вы создали вагон номер #{wagon_number}" Пока не использовать,т.к. не знаю,как сделать так,чтобы писало только тогда,когда маршрут создан 
  end

  def valid?
    validate!
    true
  rescue
    false  
  end 

  protected

  def validate!
    raise "Номер вагона не был введен" if number.nil?
    raise "Некорректный формат номера вагона" if number !~ NUMBER_FORMAT
  rescue StandardError => e
    puts "Ошибка: #{e.message}"
    puts "Введите корректные данные"
  end
end
