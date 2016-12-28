require './Chromosome.rb'
require './HelperFunctions.rb'

class Generation
  
  @@gen_num = 0

  def initialize pop_size,leaves
    @generation = []
  	pop_size.times do 
  		@generation<< Chromosome.new(leaves)
  	end
  	@roulette_wheel = []
  	@@gen_num += 1
  	p "Genration #{@@gen_num} evolved !"
  end

  def get
    @generation
  end

  def rate_generation
  	@total = 0
  	@generation.each_with_index do |i,j|
  		@total += i.fitness_function_1 + 1
  		@roulette_wheel << @total
  	end
  	p "Rating complete for generation #{@@gen_num}"
  end

  def new_generation
  	ar = []  
  	until ar.size == @generation.size
  		c, d = get_individual, get_individual	
  		offspring1, offspring2 = Chromosome.cross_over c,d
  		ar << offspring1
  		ar << offspring2 unless ar.size == @generation.size
  	end
  	re_initialize_generation ar
  end

  private

  def re_initialize_generation ar
  	@generation = ar
  	@total = 0
  	@roulette_wheel = []
  	@@gen_num += 1
  	p "Genration #{@@gen_num} evolved !"
  end

  def get_individual #gen a random num and return chromosome at first index  where roulette_cumulative_sum > randdom
  	ind = HelperFunctions::binary_search(@roulette_wheel,rand(@total+1) )
  	@generation[ind]
  end

end

