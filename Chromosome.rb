require './Calendar.rb'
 
class Chromosome
 
  @@cross_over_rate = 0.6
  @@mutation_rate = 0.01

  def initialize(leaves)
    @string = Calendar::CHROMSOME_TEMPLATE.clone() #0 - working_day , sun/sat/gazzeted - 1 , 2 - leaves
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
      @fitness_score -= ((j-pv)-3 )  if j-pv>3 && ch=='0'
      pv = j if ch!='0'
    end
    @fitness_score = [0 , @fitness_score].max
  end

  def self.cross_over a,b
    c = Marshal::load(Marshal.dump(a))
    d = Marshal::load(Marshal.dump(b))
    ar1 , ar2 = [],[]
    rep_c , rep_d = c.get , d.get   #representation of c and d as internal string
    
    (0...rep_c.size).each do |i|
      ar1 << i if rep_c[i]=='0' && rep_d[i]=='2'
      ar2 << i if rep_c[i]=='2' && rep_d[i]=='0'      
    end
    
    raise "Chromosomes having diffrent number of leaves" if ar1.size != ar2.size

    (0...ar1.size).each do |i|
      if rand < @@cross_over_rate
        c.toggle_bit(ar1[i])
        c.toggle_bit(ar2[i])
        d.toggle_bit(ar1[i])
        d.toggle_bit(ar2[i])
      end
    end
    [c,d]  
  end

  def toggle_bit i
    @string[i] = ( @string[i]=='0' ) ? '2' : '0' 
  end

  def calendar_rep
    rep = []
    @string.split('').each_with_index do |i,j|
      rep << [ (Calendar::DD + j).to_s , rev_mapping(i) ]
    end
    rep
  end
  
  private

  def working_days
    ar = []
    @string.split('').each_with_index do |i,j|    
      ar << j if i=='0' 
    end
    ar
  end

  def fill_variable_leaves(ar)            #algorithm - fisher yates
    cnt = 0  
    p 'started filling un-decided leaves in chromosome template'   
    until ( cnt == @v_leaves || ar.size==0) do 
      ind = rand(ar.size)
      ar[ind] , ar[-1] = ar[-1] , ar[ind]
      @string[ar[-1]] = '2'
      ar.pop           
      cnt+=1 
    end
    p 'Chromosome ready !'
  end

  def rev_mapping i
    return "workday" if i=='0'
    return "calendar_holiday" if i=='1'
    return "probable_holiday" if i=='2'
  end

end
