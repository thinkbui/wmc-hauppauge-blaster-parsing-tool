# encoding: utf-8
require 'serialport'
require_relative './dtv_control'

# main_number = 668
# minor_number = 2
main_number = 264
minor_number = nil

if main_number && minor_number.nil?
	puts "Tuning to channel #{main_number}"
	DtvControl.open_user_channel(main_number)
elsif main_number && minor_number
	puts "Tuning to channel #{main_number}-#{minor_number}"
	DtvControl.open_user_channel(main_number,minor_number)
end