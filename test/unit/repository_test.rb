require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  test "getting a repository from url param" do
    repository = repositories(:collectd)
    assert_equal repository, Repository.from_param(repository.id)
  end
end
