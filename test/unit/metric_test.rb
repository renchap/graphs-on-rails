require 'test_helper'

class MetricTest < ActiveSupport::TestCase
  test "getting a metric from url param" do
    metric = metrics(:memory)
    assert_equal metric, Metric.from_param(metric.id)
  end
end
