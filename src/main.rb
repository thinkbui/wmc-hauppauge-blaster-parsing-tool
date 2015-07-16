require 'optparse'
require 'json'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: main.rb [options]"

  opts.on("-cCHANNEL", "--channel=CHANNEL", "Channel number") do |c|
    options[:channel] = c
  end
end.parse!

begin
	file = File.read('data/data.json')
	list_hash = JSON.parse(file)
rescue
	list_hash = {}
end

if list_hash.has_key?(options[:channel])
	output_string = list_hash[options[:channel]]
else
	output_string = options[:channel]
end

puts "Tuning to #{output_string}..."

## WRITE EXEC CALL HERE