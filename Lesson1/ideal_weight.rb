puts "Введите ваше имя"
name = gets.chomp
puts "Введите свой рост"
height = gets.chomp
ideal_weight = "#{(height.to_i - 110) * 1.15}"
if ideal_weight.to_i > 0
  puts "#{name},ваш идеальный вес равен #{(height.to_i - 110) * 1.15}"
else ideal_weight.to_i <= 0
  puts "#{name},ваш вес уже оптимальный"
end
