# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    todos << todo
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    todos << todo
  end

  def size
    todos.size
  end

  def first
    todos[0] if size > 0
  end

  def last
    todos[-1] if size > 0
  end

  def item_at(index)
    raise IndexError if index > size - 1
    todos[index]
  end

  def mark_done_at(index)
    raise IndexError if index > size - 1
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError if index > size - 1
    todos[index].undone!
  end

  def shift
    to_return = item_at(0)
    todos.delete(item_at(0))
    to_return
  end

  def pop
    to_return = item_at(-1)
    todos.delete(item_at(-1))
    to_return
  end

  def remove_at(index)
    raise IndexError if index > size - 1
    todos.delete_at(index)
  end

  def each
    counter = 0

    while counter < size
      yield(todos[counter])
      counter += 1
    end
    self
  end

  def select
    counter = 0
    selected = TodoList.new('')

    while counter < size
      if yield(todos[counter])
        selected << todos[counter]
      end
      counter += 1
    end

    selected
  end

  def find_by_title(search_string)
    select { |todo_item| todo_item.title == search_string }.first
  end

  def all_done
    select { |todo_item| todo_item.done? }
  end

  def all_not_done
    select { |todo_item| !todo_item.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo_item| todo_item.done! }
  end

  def mark_all_undone
    each { |todo_item| todo_item.undone! }
  end

  def to_s
    puts "---- Today's Todos ----"
    todos.each do |todo_item|
      puts todo_item
    end
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect
