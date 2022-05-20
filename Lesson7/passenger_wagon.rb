class PassengerWagon < Wagon

  attr_reader :seats, :num_seats, :free_seats

  def initialize(number,num_seats)
    @num_seats = num_seats
    @free_seats = num_seats
    @seats = []
    @type = "passenger"
    super(number)
  end

  def take_a_seat(num)
    if 0 < num && num <= num_seats
      seats.push(num)
      @free_seats = num_seats.to_i - @seats.length
    else
      puts "Такого места нет в поезде"
    end    
  end 
  
  def occupied_seats
    puts "Занято мест в поезде: #{@seats.length}"
    puts "Свободных мест в поезде: #{@free_seats}"
  end

  def validate!
    super
    raise "Количество мест не было введено" if num_seats.nil?
    raise "Некорректно введено количество мест" if num_seats == 0
  end
end 
