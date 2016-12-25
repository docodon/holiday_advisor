module Calendar
  require 'Nokigiri'
  require 'open-uri'
  require 'set'
  require 'Date'

  URL_TEMP = 'https://www.timeanddate.com/holidays/india/'
  CHROMOSOME = ''
  DD = nil

  def set_date
    DD = Date.today
  end

  def get_holidays
    set_date
    yy =  DD.year
    holidays = Set.new
    urls = [  URL_TEMP+yy.to_s , URL_TEMP+(yy+1).to_s  ]
    
    urls.each_with_index do |i,index|
      table = Nokogiri::HTML(open(i)).page.css('table')

      table.each do |j|
        begin
          holidays.add( Date.parse(j.css('th')+" "+(yy+index).to_s) )
        rescue ArgumentError
        end
      end        
    
    end

    holidays

  end

  def mapping(date,holidays)
    return 1 if date.wday==0 || date.wday==6    #sat/sun fixed holidays
    return 2 if holidays.include? date
    return 0
  end

  def make_chromosomes
    holidays = get_holidays

    (DD..DD+366).each do |i|
      CHROMOSOME<<mapping(i,holidays)
    end

    CHROMOSOME

  end

end

