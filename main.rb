#coding: utf-8
require 'bundler'
Bundler.require

require './myid'

def main()
	temp=`cat /sys/class/thermal/thermal_zone0/temp`
	temp.slice!(3..-1)
	temp.insert(2,".")
	str=Time.now.strftime("%Y年%m月%d日%H時%M分の温度は")+temp+'度です'
	
	#ツイッターログイン処理
	client = Twitter::REST::Client.new do |config|
		config.consumer_key=$consumer_key#API Key
		config.consumer_secret=$consumer_secret#API secret
		config.access_token=$access_token #Access token
		config.access_token_secret=$access_token_secret #Access token secret
	end

	p str
	#ツイッターに投稿
	client.update(str)
end

main()
