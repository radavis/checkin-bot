require 'net/http'

content = ARGV[0]
uri = URI("https://launchpass.launchacademy.com/api/v1/attendance")
response = Net::HTTP.post_form(uri, scan: content)

if response.code == "200"
  exit 0
else
  exit 1
end
