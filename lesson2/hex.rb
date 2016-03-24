class Hex
  attr_reader :number_string

  CONVERT_LETTER = { '0' => 0, '1' => 1, '2' => 2, '3' => 3,
                     '4' => 4, '5' => 5, '6' => 6, '7' => 7,
                     '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
                     'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15 }

  def initialize(number_string)
    @number_string = number_string
  end

  def valid?
    /[^0-2a-fA-F]/.match(number_string).nil?
  end

  def to_decimal
    return 0 unless valid?
    (0..limit).inject(0) do |trinary_number, index|
      trinary_number + conversion(number_string[index]) * 16**(limit - index)
    end
  end

  def limit
    number_string.size - 1
  end

  def conversion(character)
    if !/[a-fA-F]/.match(character).nil?
      return CONVERT_LETTER[character.downcase]
    else
      return CONVERT_LETTER[character]
    end
  end
end

hex = Hex.new('1AF')
puts hex.to_decimal
