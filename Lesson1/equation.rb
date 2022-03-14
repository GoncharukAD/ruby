a = gets.chomp
b = gets.chomp
c = gets.chomp
D = b.to_i ** 2 - 4 * a.to_i * c.to_i
if D < 0
  puts "Дискриминант равен #{D}.Корней нет"
elsif D = 0
  x = -b.to_i / 2 * a.to_i
  puts "Дискриминант равен #{D}.х равен #{x}"
else D > 0
  x1 = -b.to_i - Math.sqrt(D) / 2 * a.to_i
  x2 = -b.to_i - Math.sqrt(D) / 2 * a.to_i
  puts "Дискриминант равен #{D}.х1 равен #{x1}, x2 равен #{x2}"
end
