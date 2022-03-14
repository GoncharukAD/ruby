num = 0
array =[1, 1]

while num < 100
  num = array[-2] + array[-1]
  array << num unless num > 100
end

puts array
