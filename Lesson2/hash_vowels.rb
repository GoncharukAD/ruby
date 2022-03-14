vovels = Hash.new(0)
('a'..'z').each_with_index do |w, i|
    if  w == 'a' || w == 'e'  || w == 'i' || w == 'o' || w == 'u'
      vovels[w] = i + 1
    end
  end
puts vovels
