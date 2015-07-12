#coding: utf-8
require 'bundler'
Bundler.require

require './myid'
require './TwitterApi'

def main()
	temp=`cat /sys/class/thermal/thermal_zone0/temp`
	temp.slice!(3..-1)
	temp.insert(2,".")
	str=Time.now.strftime("%Y年%m月%d日%H時%M分の温度は")+temp+'度です'
	#twitterに投稿
	twitterApi=TwitterApi.new($consumer_key,$consumer_secret,$access_token,$access_token_secret)
	twitterApi.write(str)
end

main()
