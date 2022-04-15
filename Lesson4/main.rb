
  require_relative "route"
  require_relative "station"
  require_relative "train"
  require_relative "wagons"

  class Interface11
  puts "Привет,это программа-абстракция железной дороги"
  stations = []
  trains = []
  routes = []
  wagons = []
 #Добавить проверку на корректность введенных пользователем данных:есть ли цифра в списке или нет.  

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
    15 - Посмотреть,какой маршрут назначен поезду
    16 - Выход"
    answer = gets.chomp.to_i

    if answer == 1 #Создавать станции
      puts "Введите название станции"
      station_name = gets.chomp #!Сделать защиту от дублирования станций  
      station = Station.new(station_name)
      stations.push(station_name)
      puts "Вы создали станцию #{station_name}"

    elsif answer == 2 #Создавать поезда
      puts "Введите номер поезда поезда"
      train_number = gets.chomp.to_i
      puts "Выберите тип поезда:
      1 - Грузовой
      2 - Пассажирский"
      type = gets.chomp.to_i
      if type == 1
        train = CargoTrain.new(train_number)
        trains.push(train_number)
      elsif type == 2
        train = PassengerTrain.new(train_number)
        trains.push(train_number)  
      end
      puts "Вы создали поезд номер #{train_number}"   
      
    elsif answer == 3 #Создать маршрут 
      puts "Введите название маршрута"
      route_name = gets.chomp #!Сделать защиту от дублирования маршрутов 
      routes.push(route_name)
      puts "Введите начальную станцию маршрута"
      route_start = gets.chomp
      puts "Введите конечную станцию маршрута"
      route_finish = gets.chomp
      route1 = Route.new(route_start, route_finish, route_name)
      puts "Вы создали маршрут #{route_start} - #{route_finish}"

    elsif answer == 4 #Создать вагон  
      puts "Введите номер вагона"
      wagon_number = gets.chomp.to_i # !Сделать защиту от дублирования вагонов
      puts "Выберите тип вагона:
      1 - Грузовой
      2 - Пассажирский"
      type = gets.chomp.to_i
      if type == 1
        wagon =  CargoWagon.new(wagon_number)
        wagons.push(wagon_number)
      elsif type == 2
        wagon = PassengerWagon.new(wagon_number)
        wagons.push(wagon_number)  
      end 
      puts "Вы создали вагон номер #{wagon_number}" 

    elsif answer == 5 # Назначить маршрут поезду
      puts "Введите номер поезда поезда"
      puts trains
      n = gets.chomp.to_i #!Сделать проверку на наличие введенного номера поезда и названия маршрута
      puts "Введите название маршрута из списка"
      puts routes
      r = gets.chomp
      trains.select do |number|  
        if n == number
        number.route_set(r)
        else
          puts "Проверьте правильность введенного номера поезда"
        end
      end       
      puts "Вы назначили поезду номер #{n} маршрут #{r}"
      
    elsif answer == 6 #Добавить вагон к поезду
      puts "Введите номер поезда поезда из списка"
      puts trains
      n = gets.chomp
      puts "Введите номер вагона из списка"
      puts wagons
      w = gets.chomp
      trains.select { |number| number.add_wagons(w) if number == n}
      puts "Вы прицепили к поезду номер #{n} вагон номер #{w}"

    elsif answer == 7 #Отцепить вагон от поезда
      puts "Введите номер поезда из списка"
      puts trains
      n = gets.chomp
      puts "Введите номер вагона из списка"
      puts wagons
      w = gets.chomp
      trains.select { |number| number.remove_wagons(w) if number == n}
      puts "Вы отцепили от  поезда номер #{n} вагон номер #{w}"

    elsif answer == 8 #Переместить поезд по маршруту    
      puts "Введите номер поезда поезда"
      puts trains
      n = gets.chomp
      puts "Переместить поезд:
      1 - Вперед по маршруту
      2 - Назад по маршруту"
      m = gets.chomp
      if m == 1
        trains.select { |number| number.move_forward if number == n } 
      elsif m == 2
        trains.select { |number| number.move_back if number == n }
      end 
        #Сделать проверку,есть ли  введенный номера поезда в массиве
      
    elsif answer == 9 #Просмотреть список поездов на станции
      puts "Введите название станции"
      puts stations
      station_name = gets.chomp 
      stations.select { |s| station.trains_list if s == station} #Сделать проверку,есть ли введенная станция в массиве

    elsif answer == 10 #Просмотреть список станций
      if stations.empty?
        puts "Нет созданных станций"
      else  
        puts stations
      end 
    
    elsif answer == 11 #Посмотреть список поездов
      if trains.empty?
        puts "Нет созданных поездов"
      else  
        puts trains
      end
    elsif answer == 13 #Посмотреть список вагонов у поезда
      puts "Введите номер поезда из списка"
      puts trains
      n = gets.chomp
      trains.select do |number| 
        if number == n
          if  number.wagons.empty?
            puts "Нет прикрепленных вагонов к  поезду"
          else 
            puts  number.wagons
          end
        else
          puts "Проверьте правильность введенного номера поезда"
        end
      end    

    elsif answer == 13 #Посмотреть список маршрутов
      if routes.empty?
        puts "Нет созданных маршрутов"
      else  
        puts routes
      end 

    elsif answer == 14 #Посмотреть список вагонов
      if wagons.empty?
        puts "Нет созданных вагонов"
      else  
        puts wagons
      end
    elsif answer == 15 #Посмотреть,какой маршрут назначен поезду
      puts "Введите номер поезда из списка"
      puts trains
      n = gets.chomp
      trains.select do |number| 
        if number == n
          if  number.route.nil?
            puts "Поезду не назначен маршрут"
          else 
            puts  number.route
          end
        else
          puts "Проверьте правильность введенного номера поезда"
        end
      end        

    else answer == 16 #Выход
      break 
    end
  end
end 
