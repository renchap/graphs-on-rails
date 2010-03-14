class MetricTag < ActiveRecord::Base
  belongs_to :metric
  belongs_to :tag
end
