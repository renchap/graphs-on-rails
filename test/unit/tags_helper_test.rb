require 'test_helper'

class TagsHelperTest < ActiveSupport::TestCase
  include TagsHelper

  test "pretty tag path is correct" do
    assert_equal 'System', pretty_tag_path(tags(:system))
    assert_equal 'System / Memory', pretty_tag_path(tags(:memory))
  end
end
