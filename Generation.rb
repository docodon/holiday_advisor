require './Chromosome.rb'

class Generation
  
  def initialize pop_size,leaves
    @generation = [Chromosome.new(leaves)]*pop_size
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
  	ar = []  #no individual over here
  	until ar.size == @generation.size
  		c = get_individual   #got two individuals
  		d = get_individual	  
  	end
  end

end
