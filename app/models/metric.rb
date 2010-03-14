class Metric < ActiveRecord::Base
  belongs_to :host
  belongs_to :repository

  has_many :metric_tags
  has_many :tags, :through => :metric_tags
  
  serialize :options
  
  def self.from_param(param)
    Metric.find_by_id(param)
  end
  
  def get_data(start_date,end_date)
    self.repository.data_provider.get_data(start_date, end_date, self.options, self.repository.options)
  end
end
