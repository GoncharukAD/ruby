# Starion
spb = Station.new("Sankt-Peterburg")
train1 = Train.new(101, "cargo", 6)
train2 = Train.new(99, "passenger", 8)
train3 = Train.new(202, "passenger", 12)
train4 = Train.new(82, "cargo", 12)
spb.arrive(train1)
spb.arrive(train2)
spb.arrive(train3)
spb.trains_list
spb.trains_select("cargo")
spb.depart(202)


#Train
train1 = Train.new(101, "passenger", 12)
train1.acselerate(120)
train1.speed
train1.add_wagons(2)
train1.stop
train1.remove_wagons(1)
train1.route_set("Moscow")
train1.current_station

