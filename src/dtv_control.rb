# encoding: utf-8
require 'serialport'
require_relative './channel_hex'

module DtvControl
	extend self

	def open_user_channel(main_number,minor_number=nil)
		cmd = ChannelHex.int_array_to_hex([250,166,main_number,minor_number || 65535])

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
end