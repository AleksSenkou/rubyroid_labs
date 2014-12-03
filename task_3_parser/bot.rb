require "mechanize"
require "colorize"
require "csv"
require_relative "Parser.rb"

bot = Mechanize.new
page = bot.get('http://bashorg.org/')
parser =  Parser.new(page)
parser.print_quotes_info
parser.parsing_into_csv