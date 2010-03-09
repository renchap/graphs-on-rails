Object.class_eval { |c| undef_method :type } if Object.respond_to?(:type)

class Repository < ActiveRecord::Base
  self.inheritance_column = 'subclass_type'
  has_many :metrics
  
  def self.from_param(param)
    find(param)
  end
  
  # Scans the repository to create all metrics
  def scan
    metrics = data_provider.get_all_metrics
    metrics.each do |host_name,host_metrics|
      # Find the hostname
      host = Host.find_or_create_by_name(host_name)
      
      host_metrics.each do |metric|
        # Skip if the metric already exists
        m = Metric.find_or_create_by_unique_id_and_repository_id(metric.unique_id, self) do |new_metric|
          new_metric.host = host
        end
        m.name = metric.name
        m.options = metric.options
        m.save
        # TODO: Handle tags
      end
    end
  end
  

  def data_provider
    unless @data_provider
      require File.expand_path("../../../lib/data_providers/#{self.type}/#{self.type}", __FILE__)
      klass = DataProvider.from_shortname(self.type)
      @data_provider = klass.new(self.path)
    end
    @data_provider
  end
end
