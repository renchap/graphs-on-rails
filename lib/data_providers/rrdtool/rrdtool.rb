require File.expand_path('../../base', __FILE__)
require 'rrd'

module DataProvider
  module RRDTool
    class Provider < Base      
      DataProvider.register(self)
    end
    
    def self.rrd_index_for(rrd, rra)
      infos = rrd.info
      # Find all rra
      infos.each do |name,val|
        if name =~ /^ds\[([0-9a-zA-Z]+)\]\.index$/
          return val if $1 == rra
        end
      end
      throw Exception.new('Cant find this RRA in the RRD file')
    end
  end
end