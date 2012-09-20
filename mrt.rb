# encoding: UTF-8
require 'open-uri'
require "nokogiri"
require "json"
require 'geocoder'

num = 5
mrtArray = Array.new 	#放album的array

while num < 200 do
	tempHash = Hash.new	#每ID的hash
	
	mrtUrl = 'http://web.trtc.com.tw/c/stationdetail2010.asp?ID='+num.to_s
	mrts = Nokogiri::HTML(open(mrtUrl))
	
	puts '............num='+num.to_s
	tempHash['number'] = num.to_s
	
	flag = 1
	mrts.css('.Default:eq(2)').each do |mrt|
		if flag < 2
			tempHash['name'] = mrt.text
		elsif flag < 3
			if num == 31
				tempHash['address'] = '11568臺北市南港區南港路1段32號板南線'
			else
				tempHash['address'] = mrt.text
			end

			s = Geocoder.search(tempHash['address'])
			tempHash['latitude'] = s[0].latitude	# =>	25.0627591
			tempHash['longitude'] = s[0].longitude	# =>	121.5271317
			sleep(0.5)
		else
			break
		end
		flag =flag+1
	end
	num = num+1
	if tempHash['name'] !=nil
		mrtArray << tempHash
	end
end

puts 'total MRT numbers: '+mrtArray.count.to_s

f = File.open("mrt.json", 'w')
f.write(mrtArray.to_json)
f.close()

f = File.open("mrt_pretty.json", 'w')
f.write(JSON.pretty_generate(mrtArray))
f.close()