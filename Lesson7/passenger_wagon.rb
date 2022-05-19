class PassengerWagon < Wagon

  attr_reader :seats, :num_seats

  def initialize(number,num_seats)
    @num_seats = num_seats
    @seats = []
    @type = "passenger"
    super(number)
  end

  def take_a_seat(num)
    if 0 < num & num <= num_seats
      seats.push(num)
    else
      puts "Такого места нет в поезде"
    end    
  end 
  
  def free_seats
    puts "Свободных мест в поезде: #{num_seats.to_i - @seats.lenght}"
  end
  
  def occupied_seats
    puts "Занято мест в поезде: #{@seats.lenght}"
  end

  def validate!
    super
    raise "Количество мест не было введено" if num_seats.nil?
    raise "Некорректно введено количество мест" if num_seats == 0
  end
end 
