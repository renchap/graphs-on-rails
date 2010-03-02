require File.expand_path('../base', __FILE__)

module DataProvider
  class RRDTool < Base
    def initialize(name, short_name)
      super(name, short_name)
    end
  end
end