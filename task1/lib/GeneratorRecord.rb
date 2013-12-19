require "./lib/RU"
require "./lib/EN"

module GeneratorRecord
	class Factory
		def self.factory(location)
			case location
			when "RU" then RU::Generator	
			when "EN" then EN::Generator
			end		
		end
	end
end