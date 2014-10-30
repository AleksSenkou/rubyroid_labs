require "mechanize"
require "colorize"
POINTS = "." * 80
TABS = " " * 5
COUNT = 5

bot = Mechanize.new
page = bot.get('http://bashorg.org/')

puts TABS + page.title.green.on_black.underline
puts "Quotes: \n"
page.search(".quote").each_with_index do |quote, index|
  puts (index + 1).to_s.green + POINTS.green  
  puts quote.text
end
