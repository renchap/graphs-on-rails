require 'test_helper'

class MetricsControllerTest < ActionController::TestCase
  test "metric detail page" do
    metric = metrics(:memory)
    get :show, :id => metric.id
    assert_response :success
    assert_equal metric, assigns['metric']
  end

# TODO: add a mock for RRD calls to test this
#  test "metric json" do
#    metric = metrics(:memory)
#    get :show, :id => metric, :format => :json
#    assert_response :success
#    assert_equal metric, assigns['metric']
#  end
end
