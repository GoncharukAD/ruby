
  require_relative "route"
  require_relative "station"
  require_relative "train"
  require_relative "wagon"
  require_relative "cargo_wagon"
  require_relative "passenger_wagon"  
  require_relative "interface"
  require_relative "manufacturer_name"
  require_relative "instance_counter"
  
  interface = Interface.new
  interface.run