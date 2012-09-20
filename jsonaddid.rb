
require 'open-uri'
require "nokogiri"
require "json"
require 'geocoder'

a= open('mrt_pretty.json', "rb").read

input_json = JSON.parse(a)
anArray = Array.new 	#放album的array

count = 1
input_json.each do|node|
	tempHash = Hash.new	#每ID的hash
	puts '____'
	puts tempHash['id'] = count
	puts tempHash['name'] = node['name']
	puts tempHash['number'] = node['number']
	puts tempHash['address'] = node['address']
	puts tempHash['latitude'] = node['latitude']
	puts tempHash['longitude'] = node['longitude']

	anArray << tempHash
	count = count+1
end

puts 'total MRT numbers: '+anArray.count.to_s

f = File.open("mrt2_pretty.json", 'w')
f.write(JSON.pretty_generate(anArray))
f.close()