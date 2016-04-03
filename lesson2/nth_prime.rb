class Prime
  START = 2

  def self.nth(up_to_n)
    raise ArgumentError if up_to_n <= 0
    @n_index = up_to_n - 1
    @primes = []
    @range = START ** up_to_n
    generate_primes
    self.nth_prime
  end

  private

  def self.nth_prime
    @primes[@n_index]
  end

  def self.generate_primes
    end_of_range = @range
    (START..end_of_range).each do |possible_prime|
      break if @primes.size >= @n_index + 1
      @primes << possible_prime if self.prime_number?(possible_prime)
    end
  end

  def self.prime_number?(possible_prime)
    sqrt_of_possible_prime = Math.sqrt(possible_prime).ceil
    @primes.each do |number|
      break if number > sqrt_of_possible_prime
      return false if possible_prime % number == 0 && possible_prime != number
    end
    return true
  end
end
