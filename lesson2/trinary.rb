class Trinary
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def valid?
    /[^0-2]/.match(number).nil?
  end

  def to_decimal
    return 0 unless valid?
    (0..limit).inject(0) do |trinary_number, index|
      trinary_number + number[index].to_i * 3**(limit - index)
    end
  end

  def limit
    number.size - 1
  end
end
