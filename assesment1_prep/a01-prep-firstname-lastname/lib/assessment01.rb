require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    if accumulator
    else
      accumulator = self[0]
    end
    self.each do |x|
       accumulator += prc.call(x)
     end
     accumulator


  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).each do |x|
    if num % x == 0
      return false
    end
  end
  return true

end

def primes(num)
  store = []
  i = 2
  until store.length == num
    store << i if is_prime? i
    i += 1
  end
  store


end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1,1] if num == 2
  store = []
  store << factorials_rec(num - 1)
  store.sum

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h,k| h[k] = []}
    self.each_with_index do |x, idx|
      hash[x] << idx
    end
    hash.select do |k, v|
      v.length >= 2
    end

  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    str = self.split("")
    store = []
    i = 3
    while i <= str.length
      str.combination(i) do |comb|
        if comb. == comb.reverse
          store << comb.join("")
        end
      end
      i += 1
    end
    store
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
