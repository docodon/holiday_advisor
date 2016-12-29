require './Generation.rb'

NUM_GEN = 50
NUM_LEAVES = 25  #12 are paid and rest may vary 
NUM_CHROMOSOMES = 100

g = Generation.new(NUM_CHROMOSOMES,NUM_LEAVES)

NUM_GEN.times do |i|
	g.rate_generation
	g.new_generation
end

