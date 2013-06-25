# encoding: UTF-8
require "json"

result = Hash.new()

f = File.open("mrt.json").read
JSON.parse(f).each do |mrt|
	blo = mrt["address"][8..10]
	# p blo = mrt["address"][0..4]

	lat = mrt["latitude"]
	lng = mrt["longitude"]

	if result.include?(blo)
		result[blo] = result[blo] << {"lat"=> lat, "lng"=> lng}
	else
		result[blo] = [{"lat"=> lat, "lng"=> lng}]
	end


end

t = JSON.pretty_generate(result)

nf = File.open("mrt_convert.json", "w")
nf << t
nf.close