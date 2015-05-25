require 'messagebox'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-cCHANNEL", "--channel=CHANNEL", "Channel number") do |c|
    options[:channel] = c
  end
end.parse!

p options

File.open('C:/Users/thinkbui/test.txt','w+') do |s|
	s.puts options[:channel]
	s.puts"!!!!!!!!!!!!!!"
	s.puts ARGV.to_s
end