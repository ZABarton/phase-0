# Release 4:

# refactor this code to move method assignments to attr_ attributes. Like we did with age. Let's pare down the superfluous code.

# Your Code Here:

class Profile
# first let's finish refactoring this code
# note that there is a way to add all of the variables like :age on one line, how would we do that?
  attr_accessor(:age, :name, :occupation)

  def initialize
    @age = 27
    @name = "Kim"
    @occupation = "Cartographer"
  end

  def print_info
    puts
    puts "age: #{@age}"
    puts
    puts "name: #{@name}"
    puts
    puts "occupation: #{@occupation}"
    puts
  end

instance_of_profile = Profile.new
puts "--- printing age -----"
sleep 0.8
p instance_of_profile.age

puts "--- printing name ----"
sleep 0.8
p instance_of_profile.name

puts "--- printing occupation ----"
sleep 0.8
p instance_of_profile.occupation

puts "--- changing profile information ----"
10.times do
  print "."
  sleep 0.1
end

instance_of_profile.age = 28
instance_of_profile.name = "Taylor"
instance_of_profile.occupation = "Rare Coins Trader"


puts
puts "---- printing all profile info -----"
sleep 0.8
instance_of_profile.print_info
  # def what_is_name
  #   @name
  # end

  # def change_my_name=(new_name)
  #   @name = new_name
  # end

  # def what_is_occupation
  #   @occupation
  # end

  # def change_my_occupation=(new_occupation)
  #   @occupation = new_occupation
  # end


end