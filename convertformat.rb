require "json"

result = Hash.new([])

f = File.open("mrt.json").read
JSON.parse(f).each do |mrt|
	blo = mrt["address"][8..10]

	lat = mrt["latitude"]
	lng = mrt["longitude"]

	result[blo] = result[blo] << {"lat"=> lat, "lng"=> lng}
end

nf = File.open("mrt_convert.json", "w")
nf << result.to_json
nf.close