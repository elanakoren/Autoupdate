require 'sinatra'
require "../lib/manifest.rb"

CLIENT_DIR = "../client"

get '/hash' do
  @manifest ||= Manifest.new(CLIENT_DIR)
  content_type :json
  {hash: @manifest.hash}.to_json
end

get '/manifest' do
  @manifest ||= Manifest.new(CLIENT_DIR)
  content_type :json
  @manifest.json
end

get '/dl/**' do |path,file|
  f = "#{CLIENT_DIR}/#{file}"
  if File.exist?(f)
    send_file(f, :disposition => 'attachment', :filename => File.basename(f))
  else
    content_type :json
    {error: "File does not exist"}
  end  
end