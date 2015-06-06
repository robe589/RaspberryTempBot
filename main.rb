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
	
	client.update("test")
end

main()
