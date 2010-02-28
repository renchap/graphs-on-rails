module DataProvider
  class Base
    attr_reader :name, :short_name
    
    def initialize(name, short_name)
      self.name = name
      self.short_name = short_name
    end
  end
end