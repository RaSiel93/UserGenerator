require "./lib/Base"
require "random_data"

module EN
	class Generator < Base::Generator
		def self.generate
			name = EN::Name.name
			address = EN::AddressAndPhone.generate
			
			[name, address].join("; ")
		end
	end

	class Name
		def self.generate
			"#{Random.firstname} #{Random.lastname}"# + " " + Random.lastname
		end
	end

	class AddressAndPhone

		def self.generate
			fake  = fake_data.sample
			
			phone = [fake.phone_code, rand(10..99), rand.to_s[2..3], rand.to_s[2..6]].join("-")
			address = [Random.address_line_1, fake.city, fake.state, "US", fake.zip_code].join(", ")
			
			 [addres, phone].join('; ')
		end

		def self.fake_data
			@data ||= File.open( "./fixtures/US.txt" ).map {|r| FakeData.new(r)}
		end
		
	end

	class FakeData
		def initialize(line)
			@line = line.split(/\t/)
		end

		def city
			@line[2]
		end

		def state
		end
	end
end
