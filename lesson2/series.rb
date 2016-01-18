class Series
  attr_accessor :number, :numbers

  def initialize(number)
    @number = number
    @numbers = []
  end

  def slices(num)
    convert_to_digits
    raise ArgumentError if num > numbers.size
    final_slices = []
    slice_distance = num
    counter = 0
    while counter < number.size
      break if counter + slice_distance == number.size + 1
      final_slices << numbers[counter..(counter + slice_distance - 1)]
      counter += 1
    end
    final_slices
  end

  def convert_to_digits
    number.each_char do |digit|
      @numbers << digit.to_i
    end
  end
end

slice = Series.new('01234')
p slice.slices(4)
