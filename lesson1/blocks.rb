def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

def select(array)
  counter = 0
  selected = []

  while counter < array.size
    if yield(array[counter])
      selected << array[counter]
    end
    counter += 1
  end

  selected
end

def reduce(array, start_acc = 0)
  accumulator = start_acc
  counter = 0

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  accumulator
end

array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num }                    # => 15
puts reduce(array, 10) { |acc, num| acc + num }                # => 25
# puts reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
