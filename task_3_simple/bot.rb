require "mechanize"
require "colorize"

bot = Mechanize.new
page = bot.get('http://bashorg.org/')

puts "\nPage title: " + page.title.green.underline
