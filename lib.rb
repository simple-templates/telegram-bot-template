# Libs for http requests: 
require 'net/http'
require 'net/https'
require 'nokogiri'
require 'json'

$emojis = ['🤯', '😵‍', '💫', '😈', '🐷', '🥸', '🤗', '😶‍🌫️', '🤖', '👾', '👽', '🤡', '👹', '💀', '🧠', '🥷🏼', '🕺🏼', '🐭', '🐹', '🐗', '🌝', '🌚', '🌈','☄️', '🧘🏼‍', '🚸']
$greetings = ['bonjour', 'hola', 'hallo', 'sveiki', 'namaste', 'salaam', 'szia', 'halo', 'ciao']

def other_function()
	
end

def get_url(url)
	uri = URI(url.to_s)
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true

	request = Net::HTTP::Get.new(uri.request_uri)
	request['Cookie'] = "session=#{session_cookie}"
	resp = http.request(request)
	# puts resp.body

	data = resp.body.strip
end