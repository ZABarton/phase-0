require_relative "ruby_review"

# This returns an array of the given `size` containing random powers of `base`
# Since no power of 3 is ever a multiple of 5, this lets us create random arrays
# that contain multiples of 3 and no multiples of 5
def random_input_array(base, size)
  (1..size).map { |i| base**(1+rand(15)) }
end

describe "super_fizzbuzz" do
  it "returns 'Fizz' for multiples of 3" do
    expect(super_fizzbuzz(random_input_array(3,100))).to eq ["Fizz"]*100
  end

  it "returns 'Buzz' for multiples of 5" do
    expect(super_fizzbuzz(random_input_array(5,100))).to eq ["Buzz"]*100
  end

  it "returns 'FizzBuzz' for multiples of 15" do
    expect(super_fizzbuzz(random_input_array(15, 100))).to eq ["FizzBuzz"]*100
  end

  it "works on [1,2,3]" do
    expect(super_fizzbuzz([1,2,3])).to eq [1,2,'Fizz']
  end

  it "works on [15, 5, 3, 1]" do
    expect(super_fizzbuzz([15, 5, 3, 1])).to eq ['FizzBuzz', 'Buzz', 'Fizz', 1]
  end
end