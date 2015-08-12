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
end