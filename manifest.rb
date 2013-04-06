require 'rubygems'
require 'digest/md5'
require 'json'

class Manifest
  
  def manifest
    generate_manifest unless @manifest
    return @manifest
  end
  
  def json
    manifest.to_json
  end
  
  def hash
    Digest::MD5.hexdigest(json)
  end
  
  private
  
  def generate_manifest
    @manifest = {}
    Dir["**/*.*"].each do |entry|
      @manifest[entry] = Digest::MD5.hexdigest(File.read(entry))
    end
  end
  
end