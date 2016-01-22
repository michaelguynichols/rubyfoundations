# circular_buffer.rb

class BufferEmptyException < Exception; end

class BufferFullException < Exception; end

class CircularBuffer
  attr_reader :data, :buffer_size

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @data = []
    @buffer_size.times { buffer_append_empty }
  end

  def read
    fail BufferEmptyException if buffer_empty?
    buffer_append_empty
    @data.shift.join
  end

  def write(value)
    return if value.nil?
    fail BufferFullException if buffer_full?
    @data[first_empty_index] = [value]
  end

  def write!(value)
    return if value.nil?
    if !buffer_full?
      write(value)
    else
      read
      @data[-1] = [value]
    end
  end

  def clear
    @data.map! { |_| [] }
  end

  def buffer_empty?
    @data.select { |elem| elem == [] } == data
  end

  def buffer_full?
    @data.count { |elem| elem != [] } == buffer_size
  end

  def first_empty_index
    (0..buffer_size - 1).each { |i| return i if @data[i] == [] }
  end

  def buffer_append_empty
    @data << []
  end
end
