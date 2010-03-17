require 'test_helper'

class HostTest < ActiveSupport::TestCase
  test "getting an host from url param" do
    host = hosts(:host1)
    assert_equal host, Host.from_param(host.id)
  end
end
