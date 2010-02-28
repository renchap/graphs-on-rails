require File.expand_path('../base', __FILE__)

module DataProvider
  class Collectd < Base
    def initialize
      super('collectd', 'collectd')
    end
  end
end