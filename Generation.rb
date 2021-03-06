require './Chromosome.rb'
require './HelperFunctions.rb'

class Generation
   
  def initialize pop_size,leaves
    @generation = []
  	pop_size.times do 
  		@generation<< Chromosome.new(leaves)
  	end
  	@roulette_wheel = []
  	@gen_num = 1
    @total_score = nil
  	p "Genration #{@gen_num} evolved !"
  end

  def get
    @generation
  end

  def rate_generation
  	@total_score = 0
  	@generation.each_with_index do |i,j|
  		@total_score += i.fitness_function_1 + 1
  		@roulette_wheel << @total_score
  	end
  	p "Rating complete for generation #{@gen_num}"
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

  def top_results
    return -1 if @total_score.nil?
    sorted_individuals.last(4)
  end

  def average_score
    return -1 if @total_score.nil?
    @total_score/@generation.size.to_f
  end

  private

  def re_initialize_generation ar
  	@generation = ar
  	@roulette_wheel = []
  	@gen_num += 1
    @total_score = nil
  	p "Genration #{@gen_num} evolved !"
  end

  def get_individual #gen a random num and return chromosome at first index  where roulette_cumulative_sum > randdom
  	raise "Generation not yet rated !!" if @roulette_wheel.size == 0
    ind = HelperFunctions::binary_search(@roulette_wheel,rand(@total_score+1))
  	@generation[ind]
  end

  def sorted_individuals
    return -1 if @total_score.nil?
    @generation.sort_by { |ind| ind.fscore}
  end

end
