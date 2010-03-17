require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "path is correct" do
    system = tags(:system)
    memory = tags(:memory)
    assert_equal [ system ], system.path
    assert_equal [ system, memory ], memory.path
  end

  test "string path is correct" do
    assert_equal 'System', tags(:system).string_path
    assert_equal 'System/Memory', tags(:memory).string_path
  end

  test "find or create tag by path if tag exists" do
    memory = tags(:memory)
    assert_equal memory, Tag.find_or_create_by_path(memory.string_path)
  end

  test "find or create tag by path if tag does not exists" do
    tag = Tag.find_or_create_by_path('System/Load')
    assert tag
    assert_instance_of Tag, tag
    assert_equal 'Load', tag.name
    assert_equal tags(:system), tag.parent
  end

  test "find or create tag by path if tag and parent does not exists" do
    tag = Tag.find_or_create_by_path('Apache/Requests')
    assert tag
    assert_instance_of Tag, tag
    assert_equal 'Requests', tag.name
    
    parent = tag.parent
    assert parent
    assert_instance_of Tag, parent
    assert_equal 'Apache', parent.name
    assert_equal nil, parent.parent
  end

end
