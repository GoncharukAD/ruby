class Interface
  def initialize
    puts "Привет,это программа-абстракция железной дороги"
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end
  
  def run
    loop do
      answers = (1..16).to_a
      puts "Введите номер действия из списка:
      1 - Создать станцию
      2 - Создать поезд
      3 - Создать маршрут
      4 - Создать вагон
      5 - Назначить маршрут поезду
      6 - Добавить вагон к поезду
      7 - Отцепить вагон от поезда
      8 - Переместить поезд по маршруту
      9 - Просмотреть список поездов на станции
      10 - Посмотреть список станций
      11 - Посмотреть список поездов
      12 - Посмотреть список вагонов у поезда
      13 - Посмотреть список маршрутов
      14 - Посмотреть список вагонов
      15 - Посмотреть,какой маршрут назначен поезду
      16 - Выход"
      answer = gets.chomp.to_i
      if answers.include?(answer) == false
        puts "Выбрано некорректное значение"
      else  
        if answer == 1 #Создавать станции
          create_station
        elsif answer == 2 #Создавать поезда
          create_train  
        elsif answer == 3 #Создать маршрут 
          create_route  
        elsif answer == 4 #Создать вагон
          create_wagon  
        elsif answer == 5 # Назначить маршрут поезду
          set_route  
        elsif answer == 6 #Добавить вагон к поезду
          add_wagon 
        elsif answer == 7 #Отцепить вагон от поезда
          remove_wagon
        elsif answer == 8 #Переместить поезд по маршруту    
          set_route
        elsif answer == 9 #Просмотреть список поездов на станции
          trains_on_station
        elsif answer == 10 #Просмотреть список станций
          stations_list
        elsif answer == 11 #Посмотреть список поездов
          trains_list
        elsif answer == 13 #Посмотреть список вагонов у поезда
          trains_wagons    
        elsif answer == 13 #Посмотреть список маршрутов
          routes_list
        elsif answer == 14 #Посмотреть список вагонов
          wagons_list
        elsif answer == 15 #Посмотреть,какой маршрут назначен поезду
          train_route       
        else answer == 16 #Выход
          break 
        end
      end 
    end
  end

  private # Для сокрытия реализации

  def create_station
    puts "Введите название станции.Допустимый формат: Допустимый формат: от 2 до 15 букв без пробелов и дефисов"
    station_name = gets.chomp.capitalize 
    if @stations.include?(station_name)
      puts "Такая станция уже существует"
    else     
      station = Station.new(station_name)
      @stations.push(station_name)
    end  
    puts "Вы создали станцию #{station_name}"
  end

  def create_train
    puts "Введите номер поезда поезда.Допустимый формат: три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса"
    train_number = gets.chomp.upcase
    puts "Выберите тип поезда:
    1 - Грузовой
    2 - Пассажирский"
    type = gets.chomp
    if type == 1
      train = CargoTrain.new(train_number)
      @trains.push(train_number)
    elsif type == 2
      train = PassengerTrain.new(train_number)
      @trains.push(train_number)  
    end
    puts "Вы создали поезд номер #{train_number}"
  end
  
  def create_route
    puts "Введите название маршрута.Допустимый формат: от 2 до 15 букв первый город маршрута,дефис,от 2 до 15 букв первый город маршрута"
    route_name = gets.chomp
    if @routes.include?(route_name)
      puts "Такой маршрут уже существует"
    else  
      @routes.push(route_name)
      puts "Введите начальную станцию маршрута"
      route_start = gets.chomp
      puts "Введите конечную станцию маршрута"
      route_finish = gets.chomp
      route1 = Route.new(route_start, route_finish, route_name)
    end  
    puts "Вы создали маршрут #{route_start} - #{route_finish}"
  end
  
  def create_wagon  
    puts "Введите номер вагона.Допустимый формат: 2 буквы и 3 цифры,без дефисов и пробелов"
    wagon_number = gets.chomp.upcase
    if @wagons.include?(wagon_number)
      puts "Такой вагон уже существует"
    else   
      puts "Выберите тип вагона:
      1 - Грузовой
      2 - Пассажирский"
      type = gets.chomp.to_i
      if type == 1
        wagon =  CargoWagon.new(wagon_number)
        @wagons.push(wagon_number)
      elsif type == 2
        wagon = PassengerWagon.new(wagon_number)
        @wagons.push(wagon_number)  
      end
    end   
    puts "Вы создали вагон номер #{wagon_number}"
  end  
  
  def set_route
    puts "Введите номер поезда поезда"
    @trains
    n = gets.chomp.upcase
    puts "Введите название маршрута из списка"
     @routes
    r = gets.chomp
    @trains.select do |number|  
      if n == number
        number.route_set(r)
      else
        puts "Проверьте правильность введенного номера поезда"
      end
    end       
    puts "Вы назначили поезду номер #{n} маршрут #{r}"
  end  
  
  def add_wagon
    puts "Введите номер поезда поезда из списка"
    @trains
    n = gets.chomp
    puts "Введите номер вагона из списка"
    @wagons
    w = gets.chomp
    @trains.select { |number| number.add_wagons(w) if number == n}
    puts "Вы прицепили к поезду номер #{n} вагон номер #{w}"
  end
  
  def remove_wagon
    puts "Введите номер поезда из списка"
      @trains
      n = gets.chomp
      puts "Введите номер вагона из списка"
      @wagons
      w = gets.chomp
      @trains.select { |number| number.remove_wagons(w) if number == n}
      puts "Вы отцепили от  поезда номер #{n} вагон номер #{w}"
  end  

  def set_route
    puts "Введите номер поезда  из списка"
    @trains
    n = gets.chomp
    puts "Переместить поезд:
    1 - Вперед по маршруту
    2 - Назад по маршруту"
    m = gets.chomp
    if m == 1
      @trains.select { |number| number.move_forward if number == n } 
    elsif m == 2
      @trains.select { |number| number.move_back if number == n }
    end 
  end
  
  def trains_on_station
    puts "Введите название станции"
    @stations
    station_name = gets.chomp 
    @stations.select { |s| station.trains_list if s == station} 
  end 
  
  def stations_list
    if @stations.empty?
      puts "Нет созданных станций"
    else  
      @stations
    end
  end
  
  def trains_list
    if @trains.empty?
      puts "Нет созданных поездов"
    else  
      @trains
    end
  end
  
  def trains_wagons
    puts "Введите номер поезда из списка"
    @trains
    n = gets.chomp.upcase
    @trains.select do |number| 
      if number == n
        if  number.wagons.empty?
          puts "Нет прикрепленных вагонов к  поезду"
        else 
          number.wagons
        end
      else
        puts "Проверьте правильность введенного номера поезда"
      end
    end
  end
  
  def routes_list
    if @routes.empty?
      puts "Нет созданных маршрутов"
    else  
      @routes
    end 
  end

  def wagons_list
    if @wagons.empty?
      puts "Нет созданных вагонов"
    else  
      @wagons
    end
  end    

  def train_route
    puts "Введите номер поезда из списка"
    @trains
    n = gets.chomp
    @trains.select do |number| 
      if number == n
        if  number.route.nil?
          puts "Поезду не назначен маршрут"
        else 
          number.route
        end
      else
        puts "Проверьте правильность введенного номера поезда"
      end
    end 
  end   
end 