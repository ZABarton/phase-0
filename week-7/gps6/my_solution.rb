# Virus Predictor

# I worked on this challenge [by myself, with: Laura Montoya].
# We spent [1.5] hours on this challenge.

# EXPLANATION OF require_relative
# This program requires data from an external ruby file. The require_relative statement checks for the external file in the same directory.
# The key differences between require_relative and require is that the require_relative statement is more efficient for loading external files.
# Require can also be used to load ruby libraries rather than just ruby files.

require_relative 'state_data' 

class VirusPredictor

# The initialize method is instantianting each instance variable for the class  
  def initialize(state)
    @state = state
    @population = STATE_DATA[state][:population]
    @population_density = STATE_DATA[state][:population_density]
  end

# This calls two private methods to use our instance variables to return virus effects  
  def virus_effects
    number_of_deaths = predicted_deaths
    speed = speed_of_spread
    print "#{@state} will lose #{number_of_deaths} people in this outbreak and will spread across the state in #{speed} months.\n\n"
  end

  private 

# Using our instance variables, determine predicted death count based on pop. density
  def predicted_deaths
    
    # predicted deaths is solely based on population density 
    
    death_rate = (@population_density / 500).round(1) 
    death_rate = 0.4 if @population_density >= 250
    death_rate = 0.1 if @population_density < 50
      
    (@population * death_rate).floor

  end

# Using our instance variables, determine speed of spread based on population density  
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    
    if @population_density >= 200
      0.5
    elsif @population_density >= 150
      1
    elsif @population_density >= 100
      1.5
    elsif @population_density >= 50
      2
    else
      2.5
    end

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects



STATE_DATA.each do |state,data|

  state = VirusPredictor.new(state)
  
  state.virus_effects

end

#=======================================================================
# Reflection Section

=begin
What are the differences between the two different hash syntaxes shown in the state_data file?

  The first hash stores its keys as strings and the values as other hashes. The "value" hashes
  store its keys as symbols and values as either floats or integers. The syntax is different because
  using symbols for keys allows you to write a shorthand form of defining a hash - you can place a colon
  immediately on the right of the key to replace a hash rocket. Symbols are more useful as keys
  when they are repeated a lot (in this example, 50 times) because each symbol is unique and is only stored
  once in memory. Given enough scale, this will save quite a bit of memory over creating the same number of
  string objects instead.

What does require_relative do? How is it different from require?

  Require_relative tries to load an external file from a path relative to where the original
  file is stored. Require will try to load a file from an absolute path but also will default to
  any paths stored via LOAD_PATH. Require can also load different types of files aside from
  other ruby (.rb) files.

What are some ways to iterate through a hash?

  You can iterate over a hash by key or by value. When writing a code block for a simple
  iterative method such as each, you can create two placeholder variables to represent
  both sides of the key value pair. The code block can then execute its function on each
  part of the hash. This can also be used to iterate through nested hashes, as you can
  iterate over each value to reach the hashes stored on the value side of the top-level hash.

When refactoring virus_effects, what stood out to you about the variables, if anything?

  Within virus_effects, two methods were called that passed instance variables as arguments.
  However, passing instance variables between class methods is totally unnecessary, as
  one of the defining features about instance variables is that they can be used anywhere
  within the class. Therefore, we could refactor out the arguments and change the private
  methods to accept zero arguments.

What concept did you most solidify in this challenge?  

  I feel like this challenge really helped solidify how powerful refactoring could be.
  I better understand the balance between efficiency and readability, and why you would
  choose to focus on one over the other. Readability is useful for smaller projects to be
  shared with others, while raw efficiency is prized when speed of calculation is an
  objective. Personally, I also feel like coming up with an elegant refactored solution
  is incredibly satisfactory.  
=end