require 'test_helper'

class ApplicationHelperTest < ActiveSupport::TestCase
  include ApplicationHelper

  test "page title is correct" do
    assert_equal 'Graphs on Rails', page_title
    @page_title = 'Home'
    assert_equal 'Home / Graphs on Rails', page_title
  end
end
