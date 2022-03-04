a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
if  a == b and b == c and a == c
  puts "Равносторонний треугольник"
elsif a == b or b == c or a == c
  puts "Равнобедренный треугольник"
else (c ** 2) == (a ** 2) + (b ** 2)
  puts "Прямоугольный треугольник"
end
