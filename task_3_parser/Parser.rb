POINTS = "." * 85
TABS = " " * 16

class Parser
  def initialize(page, quotes_count = 7, csv_file = "quotes.csv")
    @page = page
    @quotes_count = quotes_count
    @csv_file = csv_file
    parsing_context
    parsing_date_and_number
  end

  def print_quotes_info
    puts "\n" + TABS + @page.title.green.on_black.underline
    puts "\nЦитаты:".light_red
    0.upto(@quotes_count - 1) do |num|
      puts POINTS.cyan
      puts @quote_numbers[num] + @dates[num]
      puts @contexts[num]
    end
  end

  def parsing_into_csv
    CSV.open("#{@csv_file}", "w") do |csv|
      csv << ["number", "date", "contexte"]
      csv << @quote_numbers + @dates + @contexts
    end
  end

  def print_csv_file
    CSV.foreach("#{@csv_file}") do |row|
      puts row
    end
  end

  private
  def parsing_context
    @contexts = []
    @page.parser.css('br').each { |br| br.replace("\n") }
    @page.search(".quote").each_with_index do |context, index|
      index < @quotes_count ? @contexts << context.text : break
    end
  end

  def parsing_date_and_number
    @quote_numbers = []
    @dates = []
    @page.search(".vote").each_with_index do |info, index|
      break if index >= @quotes_count
      quote_info = info.text.strip
      @quote_numbers << quote_info.slice(0, 13).light_blue
      @dates << quote_info.slice(15, 17).green
    end
  end
end
