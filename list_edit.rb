require 'optparse'
require 'json'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: list_edit.rb [options]"

  opts.on("-cCHANNEL", "--channel=CHANNEL", "Channel number") do |c|
    options[:channel] = c
  end

  opts.on("-aACTUAL", "--actual=ACTUAL", "Actual channel number") do |a|
    options[:actual] = a
  end

  opts.on("-dDELETE", "--delete=DELETE", "Delete channel number") do |d|
    options[:delete] = d
  end
end.parse!

# p options

begin
	file = File.read('data.json')
	list_hash = JSON.parse(file)
rescue
	list_hash = {}
end

# puts "^^^^^^^^^^^^^^^^^"

# puts list_hash

if options[:channel] && options[:actual]
	list_hash[options[:channel]] = options[:actual]
	puts "New remap:"
	puts "Input value: #{options[:channel]}"
	puts "Output value: #{options[:actual]}"
elsif options[:delete]
	list_hash.delete(options[:delete])
	puts "Removing remap for input #{options[:delete]}"
else
	puts "Channel remap list unaltered"
end

# puts list_hash

# File.open('C:/Users/thinkbui/test.txt','w+') do |s|
# 	s.puts options[:channel]
# 	s.puts options[:actual]
# 	s.puts "!!!!!!!!!!!!!!"
# 	s.puts list_hash
# end

File.open('data.json','w') do |f|
	f.write(list_hash.to_json)
end