# holiday_advisor


making advisor - atleast one project I can be proud of :( :(

1) fetch sunday/sat/govt_holidays              # module problem
2) user-input -> ar[fixed_holidays]            # most prob in date/month  [module problem]
3) user-input -> unpaid_leaves paid_leaves     # variables                 
4) gen_random_chromosomes , using above info   # class Chromosome
5) gen_generation_of_chromsomes                # class population 
6) fitness functions                           # module GA
7) crossover functions                         # module GA
8) mutation functions                          # module GA
9) convert_chromosome_to_solution              # class chromosome


********************************************************************************************************

module Calendar
end

class chromosome
    
    def initialize  
      Problem.init_holidays
      get decided_holidays num_[unpaid,paid]_leaves
      fitness_score
    end

    def gen_chromosome        #string of length 365, 0-working_day , 1-fix_holiday_sun_sat , 2-paid_or_unpaid_leaves[variable], 3-decided_leaves
    end

    def solution
    end

end

class population
  
  def initialize
  end

  def top_solutions
  end

end

module GA

  def create_generation(size)
  end

  def fitness(chromsome)
  end

  def crossover(chromosome1,chromosome2)
  end

  def mutation(chromosome)
  end

  def rate_generation(gen)  #for every chromosome assign fitness score
  end

  def create_new_generation
  end

end

MAIN script
  
  gets gen_size , num_gen

  gen = create_generation(n)

  num_gen.times do 
    gen = create_new_generation
  end

  gen.top_solutions.each do |i|
    i.solution
  end

END

***************************************************************************************************************