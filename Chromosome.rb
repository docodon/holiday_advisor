require './Calendar.rb'
 
class Chromosome
  include Calendar

  def initialize(leaves)
    @string = Calendar.make_chromosome  # 0 - working_day , sun/sat/gazzeted - 1 , 2 - leaves
    @v_leaves = leaves
    @fitness_score = nil
    fill_variable_leaves( working_days )
  end

  def get
    @string
  end

  def fscore
    @fitness_score
  end

  def fitness_function_1
    @fitness_score = 100
    pv=-1
    @string.split('').each_with_index do |ch,j|
      @fitness_score -= (5-(j-pv) )  if j-pv>3 && ch=='0'
      pv = j if ch!='0'
    end
    @fitness_score = [0 , @fitness_score].max
  end

  private

  def working_days
    ar = []
    @string.split('').each_with_index do |i,j|    
      ar << [ j,0 ] if i=='0' 
    end
    ar
  end

  def fill_variable_leaves ar
    cnt = 0   
    until cnt == @v_leaves do 
       ind = rand(ar.size)
       if ar[ind][1] == 0
          @string[ar[ind][0]] , ar[ind][1] = '2' , 1
          cnt+=1 
       end
    end
  end
end
