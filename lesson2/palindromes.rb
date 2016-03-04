class Palindrome
  attr_reader :max_factor, :min_factor

  def initialize(number, max_factor, min_factor)
    @number = number
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def value
    @number
  end

  def factors
    all_factors = []
    (min_factor..max_factor).each do |first_number|
      (min_factor..max_factor).each do |second_number|
        product = first_number * second_number
        product_pair = [first_number, second_number]
        if product == @number && !all_factors.include?(product_pair.sort)
          all_factors << [first_number, second_number]
        end
      end
    end
    all_factors
  end
end

class Palindromes
  attr_reader :max_factor, :min_factor, :all_palindromes

  def initialize(args)
    @max_factor = args[:max_factor] if args[:max_factor]
    @min_factor = args[:min_factor] ? args[:min_factor] : 1
    @all_palindromes = []
  end

  def generate
    (min_factor..max_factor).each do |first_factor|
      (min_factor..max_factor).each do |second_factor|
        product = first_factor * second_factor
        @all_palindromes << product if palindrome?(product)
      end
    end
  end

  def palindrome?(number)
    split_number = number.to_s.each_char.map { |num| num }
    if split_number[0] == split_number[-1]
      return true if split_number.size <= 3
      new_number = split_number[1..-2].join
      palindrome?(new_number)
    else
      return false
    end
  end

  def largest
    Palindrome.new(all_palindromes.max, max_factor, min_factor)
  end

  def smallest
    Palindrome.new(all_palindromes.min, max_factor, min_factor)
  end
end
