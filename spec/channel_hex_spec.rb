require 'spec_helper'

# encoding: utf-8

describe 'ChannelHex' do
	describe 'int_to_hex' do
		it 'should convert a number to a string' do
			channel_num = 189
			expect(ChannelHex.int_to_hex(channel_num)).to be_a String
		end

		it 'should convert a small number to a 2-char hex string' do
			channel_num = 56
			expect(ChannelHex.int_to_hex(channel_num).length).to eq(2)
		end

		it 'should convert a large number to a 2-char hex string' do
			channel_num = 1556
			expect(ChannelHex.int_to_hex(channel_num).length).to eq(2)
		end

		it 'should convert a small number to the correct string' do
			channel_num = 75
			expected_output = "\x00\x4B".force_encoding(Encoding::ASCII_8BIT)
			expect(ChannelHex.int_to_hex(channel_num)).to eq(expected_output)
		end

		it 'should convert a large number to the correct string' do
			channel_num = 2015
			expected_output = "\x07\xDF".force_encoding(Encoding::ASCII_8BIT)
			expect(ChannelHex.int_to_hex(channel_num)).to eq(expected_output)
		end
	end

	describe 'hex_to_int' do
		it 'should convert a small hex string to an integer' do
			channel_hex = "\x00\x59".force_encoding(Encoding::ASCII_8BIT)
			expect(ChannelHex.hex_to_int(channel_hex)).to be_a Integer
		end

		it 'should convert a large hex string to an integer' do
			channel_hex = "\x01\xFF".force_encoding(Encoding::ASCII_8BIT)
			expected_output = 511
			expect(ChannelHex.hex_to_int(channel_hex)).to eq(expected_output)
		end

		it 'should convert a hex string to the correct integer' do
			channel_hex = "\x00\x45".force_encoding(Encoding::ASCII_8BIT)
			expected_output = 69
			expect(ChannelHex.hex_to_int(channel_hex)).to eq(expected_output)
		end

		it 'should convert a hex string to the correct integer' do
			channel_hex = "\x10\x00".force_encoding(Encoding::ASCII_8BIT)
			expected_output = 4096
			expect(ChannelHex.hex_to_int(channel_hex)).to eq(expected_output)
		end
	end

	describe 'int_array_to_hex' do
		it 'should convert a number to a string' do
			channel_num = [189]
			expect(ChannelHex.int_array_to_hex(channel_num)).to be_a String
		end

		it 'should convert a small number to a 1-char hex string' do
			channel_num = [56]
			expect(ChannelHex.int_array_to_hex(channel_num).length).to eq(1)
		end

		it 'should convert a large number to a 2-char hex string' do
			channel_num = [1556]
			expect(ChannelHex.int_array_to_hex(channel_num).length).to eq(2)
		end

		it 'should convert a small number to the correct string' do
			channel_num = [75]
			expected_output = "\x4B".force_encoding(Encoding::ASCII_8BIT)
			expect(ChannelHex.int_array_to_hex(channel_num)).to eq(expected_output)
		end

		it 'should convert a large number to the correct string' do
			channel_num = [2015]
			expected_output = "\x07\xDF".force_encoding(Encoding::ASCII_8BIT)
			expect(ChannelHex.int_array_to_hex(channel_num)).to eq(expected_output)
		end

		it 'should convert multiple numbers to the correct string' do
			channel_num = [75,2015,4096,69]
			expected_output = "\x4B\x07\xDF\x10\x00\x45".force_encoding(Encoding::ASCII_8BIT)
			expect(ChannelHex.int_array_to_hex(channel_num)).to eq(expected_output)
		end
	end


	describe 'hex_to_int_array' do
		it 'should convert a small hex string to an array' do
			channel_hex = "\x59".force_encoding(Encoding::ASCII_8BIT)
			expect(ChannelHex.hex_to_int_array(channel_hex)).to be_a Array
		end

		it 'should convert a large hex string to an array' do
			channel_hex = "\x01\xFF".force_encoding(Encoding::ASCII_8BIT)
			expected_output = [1,255]
			expect(ChannelHex.hex_to_int_array(channel_hex)).to eq(expected_output)
		end

		it 'should convert a hex string to the correct array' do
			channel_hex = "\x00\x45".force_encoding(Encoding::ASCII_8BIT)
			expected_output = [0,69]
			expect(ChannelHex.hex_to_int_array(channel_hex)).to eq(expected_output)
		end

		it 'should convert a hex string to the correct array' do
			channel_hex = "\x10\x00".force_encoding(Encoding::ASCII_8BIT)
			expected_output = [16,0]
			expect(ChannelHex.hex_to_int_array(channel_hex)).to eq(expected_output)
		end

		it 'should convert a long hex string to the correct array' do
			channel_hex = "\x10\x00\x01\xFF\x59\x4B".force_encoding(Encoding::ASCII_8BIT)
			expected_output = [16,0,1,255,89,75]
			expect(ChannelHex.hex_to_int_array(channel_hex)).to eq(expected_output)
		end
	end
end