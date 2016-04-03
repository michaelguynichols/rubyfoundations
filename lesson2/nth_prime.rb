class Prime
  RANGE = 1000000000
  START = 2

  def initialize()
    @n_index = nil
    @primes = nil
  end

  def self.nth(up_to_n)
    raise ArgumentError if up_to_n <= 0
    @n_index = up_to_n - 1
    @primes = []
    generate_primes
    self.nth_prime
  end

  def self.nth_prime
    @primes[@n_index]
  end

  private

  def self.generate_primes
    (START..RANGE).each do |possible_prime|
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
