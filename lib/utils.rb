require 'digest/sha1'

class Utils
  def self.site_key_generator
    random_array = []
    random_array << Time.now
    random_array << (1..10).map{ rand.to_s }
    Digest::SHA1.hexdigest( random_array.flatten.join('--') )
  end
end