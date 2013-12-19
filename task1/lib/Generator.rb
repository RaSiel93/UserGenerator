require "./lib/RU"
require "./lib/EN"

module Generator
	class Factory
		def self.Factory(location)
			case location
			when "RU" then RU::Generator	
			when "EN" then EN::Generator
			end		
		end
	end
end