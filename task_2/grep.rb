#! usr/bin/env ruby
#grep_file = ARG[1]

File.open("1.txt", "r").each do |file|
	p file
end
p Dir.entries "/"
