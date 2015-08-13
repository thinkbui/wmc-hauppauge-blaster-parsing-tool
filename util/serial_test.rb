# Modified from http://curiosity.roguepenguin.net/?p=35

require 'serialport'

begin
  parameters = { "baud" => 9600,
                           "data_bits" => 8,
                           "stop_bits" => 1,
                           "parity" => SerialPort::NONE }
  comm_port = 3
  serial_port = SerialPort.new(comm_port, parameters)

  serial_port.read_timeout = 1000
  serial_port.write_timeout = 1000

  # cmd = ""
  # cmd += 250.chr
  # cmd += 135.chr
  # cmd += 250.chr
  # cmd += 166.chr
  # cmd += 1.chr
  # cmd += 8.chr
  # cmd += 255.chr
  # cmd += 255.chr
  cmd = [250,166,1,8,255,255]

  serial_port.write cmd
  return_str = serial_port.readline(6)
  return_str.split("").each { |c| puts c.ord }

rescue
  puts "Error: #{$!}"
end
