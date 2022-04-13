require_relative "route"
require_relative "station"
require_relative "train"
require_relative "wagons"

puts "Привет,это программа-абстракция железной дороги"
stations = []
trains = []
routes = []
wagons = []

loop do
  puts "Введите номер действия из списка:
  1 - Создать станцию
  2 - Создать поезд
  3 - Создать маршрут
  4 - Назначить маршрут поезду
  5 - Добавить вагон к поезду
  6 - Отцепить вагон от поезда
  7 - Переместить поезд по маршруту
  8 - Просмотреть список поездов на станции
  9 - Посмотреть список станций
  10 - Создать вагон
  11 - Выход"
  answer = gets.chomp.to_i

  if answer == 1 #Создавать станции
    puts "Введите название станции"
    station_name = gets.chomp #Сделать защиту от дублирования станций  
    station = Station.new(station_name)
    stations.push(station_name)
    puts "Вы создали станцию #{station_name}"
  end

  elsif answer == 2 #Создавать поезда
    puts "Введите номер поезда поезда"
    train_number = gets.chomp
    puts "Выберите тип поезда:
    1 - Грузовой
    2 - Пассажирский"
    type = gets.chomp
    if type == 1
      train = CargoTrain.new(train_number)
      trains.push(train_number)
    elsif type == 2
      train = PassengerTrain.new(train_number)
      trains.push(train_number)  
    end 
    
  elsif answer == 3 #Создать маршрут
    puts "Введите название маршрута"
    route_name = gets.chomp #Добавить название маршрута в класс Routes как инстанс-переменную
    routes.push(route_name)
    puts "Введите начальную станцию маршрута"
    route_start = gets.chomp
    puts "Введите конечную станцию маршрута"
    route_finish = gets.chomp
    route1 = Route.new(route_start, route_finish)
    puts "Вы создали маршрут #{route_start} - #{route_finish}"

  elsif answer == 4 # Назначить маршрут поезду
    puts "Введите номер поезда поезда"
    puts trains
    n = gets.chomp.to_i
    puts "Введите название маршрута"
    puts routes
    r = gets.chomp
    trains_select {|number| number == n number.route_set(r)} #Сделать проверку на наличие введенного номера поезда и названия маршрута
    puts "Вы назначили поезду номер #{n} маршрут #{r}"
    
  elsif answer == 5 #Добавить вагон к поезду
    puts "Введите номер поезда поезда"
    n = gets.chomp.to_i
    puts "Введите номер вагона"
    w = gets.chomp.to_i
    trains_select {|number| number == n number.add_wagons(w)}


  elsif answer == 6 #Отцепить вагон от поезду
    # Доделать после редактирования классов
    puts "Введите номер поезда поезда"
    n = gets.chomp.to_i
    puts "Введите номер вагона"
    w = gets.chomp.to_i
    trains_select {|number| number == n number.remove_wagons(w)}

  elsif answer == 7 #Переместить поезд по маршруту    
    puts "Введите номер поезда поезда"
    puts trains
    n = gets.chomp.to_i
    puts "Переместить поезд:
    1 - Вперед по маршруту
    2 - Назад по маршруту"
    m = gets.chomp
    if m == 1
      trains_select {|number| number == n number.move_forward} 
    elsif m == 2
      trains_select {|number| number == n number.move_back} #Сделать проверку,есть ли  введенный номера поезда в массиве
    
  elsif answer == 8 #Просмотреть список поездов на станции
    puts "Введите название станции"
    puts stations
    station_name = gets.chomp 
    stations_select {|s| s == station station.trains_list} #Сделать проверку,есть ли введенная станция в массиве


  elsif answer == 9 #Просмотреть список станций
    puts stations
  
  elsif answer == 10 #Создать вагон
    puts "Введите номер вагона"
    wagon_number = gets.chomp.to_i
    puts "Выберите тип вагона:
    1 - Грузовой
    2 - Пассажирский"
    type = gets.chomp
    if type == 1
      wagon =  CargoWagon.new(wagon_number)
      trains.push(wagon_number)
    elsif type == 2
      wagon = PassengerWagon.new(wagon_number)
      trains.push(wagon_number)  
    end

  elsif answer == 11 #Выход
    break 
  end
end  