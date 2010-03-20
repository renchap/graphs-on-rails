require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  test "host index is correct" do
    get :index
    assert_equal 2, assigns['hosts'].size
    assert_select 'ul.hosts' do
      assert_select 'li.host', 2
    end
  end

  test "show host" do
    host = hosts(:host1)
    get :show, :id => host
    assert_equal host, assigns['host']
    assert_select 'ul.metrics' do
      assert_select 'li.metric', 2
    end
  end
end
