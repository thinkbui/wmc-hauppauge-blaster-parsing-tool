# encoding: utf-8
require 'serialport'
require_relative './channel_hex'

module DtvControl

	extend self

	def open_user_channel(main_number,minor_number=nil)
		cmd = ChannelHex.int_array_to_hex([250,166].concat(int_to_two_int_byte_array(main_number)).concat(int_to_two_int_byte_array(minor_number || 65535)))

		begin
			parameters = { "baud" => 9600,
							"data_bits" => 8,
							"stop_bits" => 1,
							"parity" => SerialPort::NONE }
			comm_port = 3
			serial_port = SerialPort.new(comm_port, parameters)

			serial_port.read_timeout = 1000
			serial_port.write_timeout = 1000

			serial_port.write cmd
			return_str = serial_port.readline(6)
			return_str.split("").each { |c| puts c.ord }

		rescue => e
			puts "ERROR: #{e.message}"
		end
	end

private

	def int_to_two_int_byte_array(num)
		return [0,0] if !num.is_a? Integer || num > 65535 || num < 0
		high_byte = num / 256
		low_byte = num % 256
		[high_byte,low_byte]
	end

	def two_int_byte_array_to_int(byte_array)
		return 0 if !byte_array.all?{|v| v.is_a? Integer} || byte_array.length != 2
		(byte_array[0] * 256) + byte_array[1]
	end

end