
require 'open-uri'
require "nokogiri"
require "json"
require 'geocoder'

a= open('cm.json', "rb").read

input_json = JSON.parse(a)
opendataArray = Array.new 	#放album的array


input_json.each do|node|
	tempHash = Hash.new	#每ID的hash
	puts '____'
	puts tempHash['area'] = node['Area']
	puts tempHash['name'] = node['Name']
	puts tempHash['address'] = node['Address']
	puts tempHash['tel'] = node['Tel']
	puts tempHash['open_time'] = node['OpeningHours']
	puts tempHash['url'] = node['URL']

	s = Geocoder.search(node['Address'])
	puts tempHash['latitude'] = s[0].latitude	# =>	25.0627591
	puts tempHash['longitude'] = s[0].longitude	# =>	121.5271317
	sleep(0.5)

	opendataArray << tempHash
end

puts 'total MRT numbers: '+opendataArray.count.to_s

f = File.open("opendata.json", 'w')
f.write(opendataArray.to_json)
f.close()

f = File.open("opendata_pretty.json", 'w')
f.write(JSON.pretty_generate(opendataArray))
f.close()