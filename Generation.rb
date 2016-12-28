require './Chromosome.rb'

class Generation
  
  def initialize pop_size,leaves
    @generation = []
  	pop_size.times do 
  		@generation<< Chromosome.new(leaves)
  	end
  	@roulette_wheel = []
  end

  def get
    @generation
  end

  def rate_generation
  	@total = 0
  	@generation.each_with_index do |i,j|
  		@total += i.fitness_function_1 + 1
  		@roulette_wheel << [@total,j]
  	end 
  end

  def get_individual #gen a random num and return chromosome at first index  where roulette_cumulative_sum > randdom
  	random = rand(@total)+1
  	(0...@generation.size).each do |i|
  		return @generation[i] if @roulette_wheel[i][0]>=random	
  	end
  end

  def new_generation
  	ar = []  
  	until ar.size == @generation.size
  		c, d = get_individual, get_individual	
  		offspring1, offspring2 = Chromosome.cross_over c,d
  		ar << offspring1
  		ar << offspring2 unless ar.size == @generation.size
  	end
  	initialize_new_generation ar
  end

  def initialize_new_generation ar
  	@generation = ar
  	@total = 0
  	@roulette_wheel = []
  end


end
