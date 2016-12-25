module Calendar
  require 'Nokogiri'
  require 'open-uri'
  require 'set'
  require 'Date'
  require 'Pry'

  URL_TEMP = 'https://www.timeanddate.com/holidays/india/'

  CHROMOSOME = ''
  DD = Date.today

  def Calendar.valid_holiday(d)
    d['class']!='head' && ( d.css('td').last.text=='Gazetted Holiday') #'Restricted Holiday'
  end


  def Calendar.get_holidays
    yy =  DD.year
    holidays = Set.new
    urls = [  URL_TEMP+yy.to_s , URL_TEMP+(yy+1).to_s  ]
    
    urls.each_with_index do |i,index|
      table = Nokogiri::HTML(open(i)).css('table')
      table.search('tr').each do |j|  
        holidays.add( Date.parse(j.css('th').text+" "+(yy+index).to_s) ) if Calendar::valid_holiday(j)
      end
    end        
    
    holidays
  end

  def Calendar.mapping(date,holidays)
    return '1' if date.wday==0 || date.wday==6  || holidays.include?(date)    #sat/sun/gazetted holidays
    return '0'
  end

  def Calendar.make_chromosomes
    holidays = Calendar::get_holidays

    (DD..DD+365).each do |i|
      CHROMOSOME<<mapping(i,holidays)
    end

    CHROMOSOME

  end

end

