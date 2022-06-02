# frozen_string_literal: true

class Wagon
  include Acсessors
  include Validation

  @@all_wagons = []

  NUMBER_FORMAT = /^[а-я]{2}\d{3}$/i.freeze

  attr_reader :type, :number

  validate :num, :presence
  validate :num, :format, NUMBER_FORMAT
  validate :attribute_class, :type, 'Wagon'

  def initialize(number)
    @number = number
    @type = nil
    register_instance
    @@all_wagons.push(self)
    validate!
    puts "Вы создали вагон номер #{number}" if valid? == true
  end
end
