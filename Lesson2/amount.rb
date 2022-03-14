base = Hash.new # База товаров
puts "Введите название товара:"
product_name = gets.chomp
puts "Введите цену за единицу товара:"
price_per_unit = gets.chomp.to_i
puts "Введите количество:"
quantity = gets.chomp.to_i
base[product_name] = {price_per_unit => quantity }
puts base
base[product_name].each do |price, quantity|
 sum =  price * quantity
puts "Общая сумма #{product_name}  равна #{sum}"

loop do
  puts "Введите название товара:"
  product_name = gets.chomp
  break if product_name == "стоп"
  puts "Введите цену за единицу товара:"
  price_per_unit = gets.chomp.to_i
  puts "Введите количество:"
  quantity = gets.chomp.to_i
  base[product_name] = {price_per_unit => quantity }
  puts base
  base[product_name].each do |price, quantity|
   sum =  price * quantity
  puts "Общая сумма #{product_name}  равна #{sum}"
  end
end

base.each do | product, p_q| # p_q это хэш прайс + количество
    p_q.each  do |p, q|
      amount = p * q
      puts "Общая сумма товаров равна #{amount}"
    end
end
