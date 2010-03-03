require File.expand_path('../base', __FILE__)

module DataProvider
  class RRDTool < Base
    def self.short_name
      'rrdtool'
    end
    
    DataProvider.register(self)
  end
end