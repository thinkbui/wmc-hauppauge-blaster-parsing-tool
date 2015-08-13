# encoding: utf-8

module ChannelHex
	extend self

	def int_to_hex(channel_num)
		return 0.chr + 0.chr if !(channel_num.is_a? Integer) || channel_num > 9999 || channel_num < 0
		channel_num.chr(Encoding::UTF_16BE).force_encoding(Encoding::ASCII_8BIT)
	end

	def hex_to_int(channel_hex)
		channel_num = 0
		channel_hex.force_encoding(Encoding::UTF_16BE).each_char do |c|
			channel_num *= 65536
			channel_num += c.ord
		end
		channel_num
	end

	def int_array_to_hex(int_array)
		int_array.map do |v|
			if !v.is_a? Integer || v > 65535 || v < 0
				result = ""
			elsif (0..255).include? v
				result = v.chr(Encoding::ASCII_8BIT)
			elsif (256..65535).include? v
				result = v.chr(Encoding::UTF_16BE).force_encoding(Encoding::ASCII_8BIT)
			end
			result
		end.join("")
	end

	def hex_to_int_array(hex_string)
		hex_string.split("").map{|v| v.ord}
	end
end