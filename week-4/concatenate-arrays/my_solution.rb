# Concatenate Two Arrays

# I worked on this challenge by myself


# Your Solution Below

def array_concat(array_1, array_2)
  new_array = []
  array_1.each { |value| new_array << value }
  array_2.each { |value| new_array << value }
  return new_array
end