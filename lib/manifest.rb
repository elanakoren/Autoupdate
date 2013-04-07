require 'rubygems'
require 'digest/md5'
require 'json'

class Manifest
  
  def initialize(directory)
    @manifest = {}
    Dir.chdir(directory) do
      Dir["**/*.*"].each do |entry|
        @manifest[entry] = Digest::MD5.hexdigest(File.read(entry))
      end
    end
  end
  
  def manifest
    return @manifest
  end
  
  def json
    manifest.to_json
  end
  
  def hash
    Digest::MD5.hexdigest(json)
  end
  
end