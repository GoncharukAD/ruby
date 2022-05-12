
  def validate_train!
    NUMBER_FORMAT = /^[а-я]{3}|\d{3}-*[а-я]|\d{2}$/
    raise "Номер поезда не был введен" if number.nil?
    raise "Некорректный формат номера поезда" if number !~ NUMBER_FORMAT
  end


  def validate_route!
    NAME_FORMAT = /^[А-Я]{2,15}$/i
    raise "Начальная станция маршрута не была введена" if start.nil?
    raise "Конечная станция маршрута не была введена" if finish.nil?
    raise "Название маршрута не было введено" if name.nil?
    raise "Некорректный формат названия маршрута" if number !~ NUMBER_FORMAT
  end

  def validate_station!
    NAME_FORMAT = /^[a-я]{2,15}$/i
    raise "Название станции не было введено" if name.nil?
    raise "Некорректный формат названия станции" if number !~ NUMBER_FORMAT
  end
  
  def valid?
    validate_train!
  rescue
    false  
  end    

  
  