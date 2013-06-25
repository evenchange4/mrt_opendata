# [捷運站經緯度坐標 Open data](https://raw.github.com/evenchange4/mrt_opendata/master/mrt.json) 
- 2013 夏，取得的站數為 `96` 站。

## 步驟做法
1. 爬取捷運站的[官方網站](http://web.trtc.com.tw/c/stationdetail2010.asp?ID=19)來取得每一個捷運站的地址。
	- 各站的 ID 可以從 [www.trtc.com.tw](http://www.trtc.com.tw/ct.asp?CtNode=24569&mp=122031&xItem=1015926) html `option`'s attribute `value` 取得。
2. 再使用 ruby gem `"geocoder"` 將地址來取得經緯度。
	- example: "10576臺北市松山區敦化北路338號" -> "25.063718, 121.549643"
	- ![geocoder demo](http://media-cache-ec3.pinimg.com/originals/e3/04/37/e30437b99265e324397a1477f7afce8b.jpg)

## 捷運站坐標: `mrt.json`

```
[
  {
    "id": 1,
    "name": "松山機場",
    "number": "7",
    "address": "10576臺北市松山區敦化北路338號",
    "latitude": 25.063718,
    "longitude": 121.549643
  },
  {
    "id": 2,
    "name": "中山國中",
    "number": "8",
    "address": "10476臺北市中山區復興北路376號",
    "latitude": 25.0607843,
    "longitude": 121.5439248
  },
  ...
```

## Reference
- [www.trtc.com.tw](http://www.trtc.com.tw/ct.asp?CtNode=24569&mp=122031&xItem=1015926)
- ruby gem [geocoder](http://www.rubygeocoder.com/)