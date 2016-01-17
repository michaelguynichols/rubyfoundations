require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'to_do'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_to_size
    assert_equal(3, @list.size)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_shift
    skip
    assert_equal(@todo1, @list.shift)
  end

  def test_pop
    skip
    assert_equal(@todo3, @list.pop)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(IndexError) do
      @list.remove_at(100)
    end
  end

  def test_add
    list_copy = @list.clone
    test_todo = Todo.new("Just added")
    list_copy << test_todo
    assert_equal(list_copy.item_at(3), test_todo)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert(@list.item_at(0).done?)
  end

  def test_mark_undone_at
    @list.mark_undone_at(0)
    assert(!@list.item_at(0).done?)
  end

  def test_done!
    skip
    @list.item_at(0).done!
    assert(@list.item_at(0).done?)
  end

  def test_remove_at
    skip
    @list.remove_at(0)
    assert(@list.item_at(0) != @todo1)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    skip
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    skip
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end
end
