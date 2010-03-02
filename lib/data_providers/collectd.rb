require File.expand_path('../rrdtool', __FILE__)

module DataProvider
  class Collectd < RRDTool
    def initialize
      super('collectd', 'collectd')
    end
  end
end