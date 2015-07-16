# Serial API / Channel Remapping Parser for Hauppauge's MCE Tool
Using Hauppauge products with Windows 7 Media Center doesn't offer access to subchannels by default and is nearly impossible to add for some, such as the Colossus, that are used with set top boxes.  There are tools to add subchannels to Media Center's guide, but the format of the channel number isn't necessarily something that the set top box or third party tools used with Hauppauge's MCE tool can understand.  Initially this project was meant more for debugging purposes and operate as an intermediary API for another third party CLI, but after some exploratory development, the aim has now shifted to produce the CLI that will directly communicate with the set top box.

## Release Alpha 2
Added basic test of 'serialport' gem to verify that it works in a Windows 7 environment controlling COM4.

## Release Alpha 1
Added CLI editing tool for maintaing the list of remapped channel numbers.

## Release Alpha 0
Basic CLI completed to read arguments and display channel number in a Windows message box.
