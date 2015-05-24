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

MessageBox.new("Test Title", options[:channel]).show