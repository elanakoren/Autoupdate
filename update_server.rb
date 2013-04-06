require 'sinatra'
require "./manifest.rb"

get '/hash' do
  @manifest ||= Manifest.new
  content_type :json
  @manifest.hash
end

get '/manifest' do
  @manifest ||= Manifest.new
  content_type :json
  @manifest.json
end

get '/dl/**' do |file|
  send_file(file, :disposition => 'attachment', :filename => file)
end