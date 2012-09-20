
require 'open-uri'
require "nokogiri"
require "json"
require 'geocoder'

mrt= open('mrt.json', "rb").read
mrtjson = JSON.parse(mrt)
opendata= open('opendata.json', "rb").read
opendatajson = JSON.parse(opendata)

anArray = Array.new

mrtjson.each do|mrtNode|
	tempHash = Hash.new	#每ID的hash
	tempHash['mrt_id'] = mrtNode['id']
	puts '---'+mrtNode['name']+'---'
	anArray1 = Array.new	
	anArray2 = Array.new	
	anArray3 = Array.new	
	opendatajson.each do|opendataNode|



		distance=Geocoder::Calculations.distance_between([mrtNode['latitude'],mrtNode['longitude']], [opendataNode['latitude'],opendataNode['longitude']])
		if distance < 1
			#puts opendataNode['name'] +'-> '+ distance.to_s
			puts anArray1 << opendataNode['id']
		elsif distance < 2
			puts anArray2 << opendataNode['id']		
		elsif distance < 3
			puts anArray3 << opendataNode['id']	
		end

	end
	tempHash['near<1?'] = anArray1
	tempHash['near<2?'] = anArray2
	tempHash['near<3?'] = anArray3

	anArray << tempHash
end

#puts 'total MRT numbers: '+anArray.count.to_s
f = File.open("distance.json", 'w')
f.write(JSON.pretty_generate(anArray))
f.close()