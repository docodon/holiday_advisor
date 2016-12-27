require './Chromosome.rb'

class Generation
  
  def initialize pop_size,leaves
    @generation = [Chromosome.new(leaves)]*pop_size
  end

  def get
    @generation
  end

