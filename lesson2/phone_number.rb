class PhoneNumber
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def number
    @num = num.split(/[\s,(,),\-,.]/).join
    (num.match(/[a-z, A-Z]/) || invalid_size?) ? '0000000000' : chop_if_leading_one
  end

  def area_code
    number[0..2]
  end

  def invalid_size?
    num.size < 10 || (!num.start_with?('1') && num.size > 10) || num.size > 11
  end

  def chop_if_leading_one
    (num.start_with?('1') && num.size == 11) ? num[1..-1] : num
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end
end
