module ManufacturerName
  attr_accessor :name_company
  
  def point_name_company(name)
    self.name_company = name
    puts "Создана компания #{self.name_company}"
  end

  def get_name_company
    puts "Поезд №#{@number} принадлежит компании #{self.name_company} "
  end
end  
