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

begin
	file = File.read('data/data.json')
	list_hash = JSON.parse(file)
rescue
	list_hash = {}
end

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

File.open('data/data.json','w') do |f|
	f.write(list_hash.to_json)
end