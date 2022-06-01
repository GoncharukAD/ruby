# frozen_string_literal: true

class CargoWagon < Wagon
  attr_reader :volume, :free_volume

  def initialize(number, volume)
    @type = 'cargo'
    @volume = volume
    @free_volume = volume
    super(number)
  end

  def load_wagon(amount)
    if amount <= @free_volume
      @free_volume -= amount
    else
      puts 'Недостаточно объема в вагоне'
    end
  end

  def occupied_volume
    puts "Занятый объем в вагоне: #{@volume - @free_volume}"
    puts "Осталось свободного объема #{free_volume}"
  end

  def validate!
    super
    raise 'Количество мест не было введено' if volume.nil?
    raise 'Некорректно введено количество мест' if volume.zero?
  end
end
