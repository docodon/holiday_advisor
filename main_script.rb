require './Generation.rb'

NUM_GEN = 400
NUM_LEAVES = 50  #assumption 12 are official and rest may vary acc. to person
NUM_CHROMOSOMES = 500

g = Generation.new(NUM_CHROMOSOMES,NUM_LEAVES)
g.rate_generation
vc = g.top_results

ar = []

NUM_GEN.times do |i|
	g.rate_generation
	ar << g.average_score
	g.new_generation
end

g.rate_generation
b = g.top_results

