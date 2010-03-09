require File.expand_path('../../base', __FILE__)
require 'rrd'

module DataProvider
  module RRDTool
    class Provider < Base      
      DataProvider.register(self)
    end
  end
end
