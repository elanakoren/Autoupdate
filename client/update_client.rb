require 'rubygems'
require 'net/http'
require 'json'

SERVER = "localhost"
PORT = 4567

def get_json(path)
  resp = nil
  Net::HTTP.start(SERVER,PORT) do |http|
    resp = http.get(path)
  end
  JSON.parse(resp.body)
end

hash = get_json('/hash')
puts "Server Hash is #{hash}"

manifest = get_json('/manifest')
puts "Server Manifest is #{manifest}"