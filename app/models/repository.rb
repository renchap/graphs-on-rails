class Repository < ActiveRecord::Base
  self.inheritance_column = 'subclass_type'
  has_many :metrics
  
  def self.from_param(param)
    find(param)
  end
  
  # Scans the repository to create all metrics
  def scan
    metrics = data_provider.get_all_metrics
    metrics.each do |metric|
      # Create this metric
    end
  end
  

  def data_provider
    unless @data_provider
      require File.expand_path('../../../lib/data_providers/'+self.type, __FILE__)
      klass = DataProvider.from_shortname(self.type)
      @data_provider = klass.new(self.path)
    end
    @data_provider
  end
end
