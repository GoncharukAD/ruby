
  require_relative "route"
  require_relative "station"
  require_relative "train"
  require_relative "wagons"
  require_relative "interface"
  require_relative "manufacturer"
  require_relative "InstanceCounter"
  interface = Interface.new
  interface.run