class Interface
  def initialize
    puts "Привет,это программа-абстракция железной дороги"
    @stations = []
    @trains = []
    @routes = {}
    @wagons = {}
  end
  
  def run
    loop do
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
      15 - Посмотреть какой маршрут назначен поезду
      16 - Загрузить грузовой вагон
      17 - Занять место в пассажирском вагоне
      18 - Выход"
      answer = gets.chomp.to_i
      case answer
      when 1 then create_station #Создавать станции
      when 2 then create_train  #Создавать поезда
      when 3 then create_route #Создать маршрут
      when 4 then create_wagon # Создать вагон
      when 5 then set_route # Назначить маршрут поезду
      when 6 then add_wagon #Добавить вагон к поезду
      when 7 then remove_wagon #Отцепить вагон от поезда
      when 8 then set_route #Переместить поезд по маршруту
      when 9 then trains_on_station #Просмотреть список поездов на станции
      when 10 then stations_list #Просмотреть список станций
      when 11 then trains_list #Посмотреть список поездов
      when 12 then trains_wagons  #Посмотреть список вагонов у поезда
      when 13 then routes_list #Посмотреть список маршрутов
      when 14 then wagons_list #Посмотреть список вагонов
      when 15 then train_route #Посмотреть какой маршрут назначен поезду
      when 16 then load_wagon  #Посмотреть какой маршрут назначен поезду
      when 17 then take_a_seat #Занять место в пассажирском вагоне
      when 18 then break #Выход
      else
        puts "Выбрано некорректное значение"
      end 
    end
  end

  def create_station
    puts "Введите название станции.Допустимый формат: Допустимый формат: от 2 до 15 букв без пробелов и дефисов"
    station_name = gets.chomp
    if station_name == @stations.each { |s| s.name }# Не работает
      puts "Такая станция уже существует"
    else  
      begin    
        station = Station.new(station_name)
      rescue StandardError => e
        puts "Ошибка: #{e.message}"
        puts "Введите корректные данные"
      end
      @stations << station 
    end   
  end

  def create_train
    puts "Введите номер поезда поезда.Допустимый формат: три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса"
    train_number = gets.chomp
    if train_number == @trains.each { |t| t.number }# Не работает
      puts "Такой поезд уже существует"
    else  
      puts "Выберите тип поезда:
      1 - Грузовой
      2 - Пассажирский"
      type = gets.chomp.to_i
      if type == 1
        begin
          train = CargoTrain.new(train_number)
        rescue StandardError => e
          puts "Ошибка: #{e.message}"
          puts "Введите корректные данные"
        end
        @trains << train
      elsif type == 2
        begin
          train = PassengerTrain.new(train_number)
        rescue StandardError => e
          puts "Ошибка: #{e.message}"
          puts "Введите корректные данные"
        end
        @trains << train
      end
    end  
  end
  
  def create_route
    puts "Введите название маршрута.Допустимый формат: от 2 до 15 букв первый город маршрута,дефис,от 2 до 15 букв первый город маршрута"
    route_name = gets.chomp
    if @routes.include?(route_name)#Не работет
      puts "Такой маршрут уже существует"
    else  
      puts "Введите начальную станцию маршрута"
      route_start = gets.chomp
      puts "Введите конечную станцию маршрута"
      route_finish = gets.chomp
      begin
        route = Route.new(route_start, route_finish, route_name)
      rescue StandardError => e
        puts "Ошибка: #{e.message}"
        puts "Введите корректные данные"
      end
      @routes[route_name] = route 
    end     
  end
  
  def create_wagon  
    puts "Введите номер вагона.Допустимый формат: 2 буквы и 3 цифры,без дефисов и пробелов"
    wagon_number = gets.chomp
    if @wagons.include?(wagon_number) #Не работает
      puts "Такой вагон уже существует"
    else    
      puts "Выберите тип вагона:
      1 - Грузовой
      2 - Пассажирский"
      type = gets.chomp.to_i
      if type == 1
        puts "Укажите объём вагона"
        volume = gets.chomp.to_i
        begin
          wagon =  CargoWagon.new(wagon_number, volume)
        rescue StandardError => e
          puts "Ошибка: #{e.message}"
          puts "Введите корректные данные"
        end
        @wagons << wagon
      elsif type == 2
        puts "Укажите количество место в вагоне"
        seats = gets.chomp.to_i
        begin
          wagon = PassengerWagon.new(wagon_number, seats)
        rescue StandardError => e
          puts "Ошибка: #{e.message}"
          puts "Введите корректные данные"
        end
        @wagons << wagon
      end    
    end  
  end  
  
  def set_route
    puts "Введите номер поезда поезда"
    @trains.each { |train| puts train.number }
    n = gets.chomp
    puts "Введите название маршрута из списка"
    @routes.each { |r| puts r.name }
    r = gets.chomp
    @trains.select do |train|  
      if train.number == n
        train.route_set(r)
      else
        puts "Проверьте правильность введенного номера поезда"
      end
    end       
    puts "Вы назначили поезду номер #{n} маршрут #{r}"
  end  
  
  def add_wagon
    puts "Введите номер поезда поезда из списка"
    @trains.each { |train| puts train.number }
    n = gets.chomp
    puts "Введите номер вагона из списка"
    @wagons.each{ |w| puts w.number }
    w = gets.chomp
    @trains.each { |train| train.add_wagons(w) if train.number == n }
    puts "Вы прицепили к поезду номер #{n} вагон номер #{w}"
  end
  
  def remove_wagon
    puts "Введите номер поезда из списка"
    @trains.each { |train| puts train.number }
    n = gets.chomp
    puts "Введите номер вагона из списка"
    @wagons.each { |w| puts w.number }
    w = gets.chomp
    @trains.each { |train| train.remove_wagons(w) if train.number == n }
    puts "Вы отцепили от  поезда номер #{n} вагон номер #{w}"
  end  

  def set_route
    puts "Введите номер поезда  из списка"
    @trains.each { |train| puts t.number }
    n = gets.chomp
    puts "Переместить поезд:
    1 - Вперед по маршруту
    2 - Назад по маршруту"
    m = gets.chomp
    if m == 1
      @trains.each { |train| train.move_forward if train.number == n } 
    elsif m == 2
      @trains.each { |train| train.move_back if train.number == n }
    end 
  end
  
  def trains_on_station
    puts "Введите название станции"
    @stations.each { |station| puts name }
    station_name = gets.chomp
    if name == station_name 
      @stations.each do |station| 
        station.trains_list_actions do |t| 
          puts t.number
          puts t.type
          puts t.wagons_list
        end
      end
    else
      puts "Некорректно написано название станции"
    end   
  end 

  def stations_list
    if @stations.empty?
      puts "Нет созданных станций"
    else  
      @stations.each { |s| puts s.name }
    end
  end

  def trains_list
    if @trains.empty?
      puts "Нет созданных поездов"
    else  
      @trains.each { |train| puts train }
    end
  end

  def trains_wagons
    puts "Введите номер поезда из списка"
    @trains.each { |train| puts train.number }
    n = gets.chomp
    @trains.select do |train| 
      if number == train.number
        if  train.wagons_list_actions.empty?
          puts "Нет прикрепленных вагонов к  поезду"
        else 
          train.wagons_actions do |w|
            puts w.type
            puts w.occupied_seats if w.type == "passenger"
            puts w.occupied_volume if w.type == "cargo"
          end  
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
      @routes.each { |r| puts r}
    end 
  end

  def wagons_list
    if @wagons.empty?
      puts "Нет созданных вагонов"
    else  
     @wagons.each { |w| puts n}
    end
  end

  def train_route
    puts "Введите номер поезда из списка"
    @trains.each { |n, t| puts n}
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

  def load_wagon
    @wagons.each { |w| puts w.number if w.class == CargoWagon}
    puts "Введите номер вагона.Допустимый формат: 2 буквы и 3 цифры,без дефисов и пробелов"
    wagon_number = gets.chomp
    if @wagons.include?(wagon_number)
      puts "Введите количество груза"
      amount = gets.chomp.to_i
      @wagons.each { |n, w|  w.load_wagon(amount) && w.occupied_volume if w.number == wagon_number }
    else
      puts "Такого вагона не существует"
    end     
  end

  def take_a_seat
    @wagons.each { |w| puts w.number if w.class == PassengerWagon }
    puts "Введите номер вагона.Допустимый формат: 2 буквы и 3 цифры,без дефисов и пробелов"
    wagon_number = gets.chomp
    if @wagons.include?(wagon_number)
      puts "Введите номер места"
      seat = gets.chomp.to_i
      @wagons.each { |w|  w.take_a_seat(seat) && w.occupied_seats if w.number == wagon_number }
    else
      puts "Такого вагона не существует"
    end     
  end
end 