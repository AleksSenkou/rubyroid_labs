require "mechanize"
require "colorize"
POINTS = "." * 65
TABS = " " * 5
COUNT = 7

def parsing_page(page)
  puts TABS + page.title.green.on_black.underline
  puts "Quotes:"
  
  quotes = parsing_quotes(page)
  page.search(".vote").search('a[1]').each_with_index do |citat, index|
    break if index >= COUNT
    puts citat.text.green + POINTS.green
    puts quotes[index]
  end
end

def parsing_quotes(page)
  quotes = []
  page.search(".quote").each_with_index do |quote, index|
    index < COUNT ? quotes << quote.text : break
  end
  quotes
end

bot = Mechanize.new
page = bot.get('http://bashorg.org/')
parsing_page(page)

