require 'test/unit'
require_relative '../../lib/letters_node'
class LetterNodeTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @root = MyMod::LettersNode.new_root
  end

  def test_root_node
    assert_not_nil @root
  end

  def test_child_has_correct_data
    node = @root.new_or_existing_child 'c'
    assert node.charachter == 'c'
  end

  def test_child_added_to_parent
    node = @root.new_or_existing_child 'c'
    assert @root.children.include? node
  end

  def test_has_children_when_child_exists
    node = @root.new_or_existing_child 'c'
    assert @root.has_child 'c'
  end

  def test_has_children_when_child_not_exists
    assert (!@root.has_child 'c')
  end

  def test_get_child
    node = @root.new_or_existing_child 'c'
    assert_not_nil @root.get_child 'c'
  end

  def test_get_child_when_child_not_exists
      assert_nil @root.get_child 'c'
  end

  def test_child_not_added_twice
    node1 = @root.new_or_existing_child 'c'
    node2 = @root.new_or_existing_child 'c'
    assert @root.children.size == 1
    assert_equal node1, node2
    assert_same node2, node1
  end
end