class Url < ActiveRecord::Base
	validates :long_url, presence: true 
	validates :long_url, presence: true, :format => {:with => /(^http:\/\/|https:\/\/)/} 
	validates :short_url, presence: true
	def shorten
		self.short_url = SecureRandom.hex(5)
	end

	def self.retrieve_short_url(url)
		a = Url.find_by(long_url: url)
		if a != nil 
			short = a.short_url
			short
		end 
	end 
end
