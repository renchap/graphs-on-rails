require 'test_helper'

class RepositoriesControllerTest < ActionController::TestCase
  test "Repository index lists all repositories" do
    get :index
    assert_response :success
    assert_equal 1, assigns['repositories'].size
    assert_select 'ul.repositories' do
      assert_select 'li.repository', 1
    end
  end

  test "repository detail page" do
    repos = repositories(:collectd)
    get :show, :id => repos
    assert_response :success
    assert_equal repos, assigns['repository']
  end
end
