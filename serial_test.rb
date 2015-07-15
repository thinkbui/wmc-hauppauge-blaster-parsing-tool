require 'serialport'

begin
  parameters = { "baud" => 19200,
                           "data_bits" => 8,
                           "stop_bits" => 1,
                           "parity" => SerialPort::NONE }
  comm_port = 3
  serial_port = SerialPort.new(comm_port, parameters)

  serial_port.read_timeout = 1000
  serial_port.write_timeout = 1000

  cmd = 250.chr
  cmd += 135.chr

  serial_port.write cmd
  return_str = serial_port.readline(6)
  return_str.split("").each { |c| puts c.ord }

rescue
  puts "Error: #{$!}"
end