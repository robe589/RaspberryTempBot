#coding: utf-8
require 'bundler'
Bundler.require

require './myid'

def main()
	client = Twitter::REST::Client.new do |config|
		config.consumer_key=$consumer_key#API Key
		config.consumer_secret=$consumer_secret#API secret
		config.access_token=$access_token #Access token
		config.access_token_secret=$access_token_secret  #Access token secret
	end
	temp=`cat /sys/class/thermal/thermal_zone0/temp`
	temp.slice!(2..-1)
	str=Time.now.strftime("%Y年%m月%d日%H時の温度は")+temp+'度です'
	p str
	client.update(str)
end

main()
