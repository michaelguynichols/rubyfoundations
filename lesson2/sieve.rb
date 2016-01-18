class Sieve
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def primes
    prime_markers = []
    (2..number).each { |num| prime_markers[num] = true }
    for counter in 2..Math.sqrt(number)
      if prime_markers[counter]
        for j in 0..number
          x = counter**2 + j * counter
          if x <= number
            prime_markers[x] = false
          end
        end
      end
    end
    prime_indexes = []
    for i in 2..prime_markers.size
      if prime_markers[i]
        prime_indexes << i
      end
    end
    prime_indexes
  end
end
