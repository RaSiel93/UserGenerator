require "./lib/Base"
require "random_data"

module US
	class Generator < Base::Generator
		def self.generate
			name = US::Name.name
			address = US::AddressAndPhone.generate
			
			[name, address].join("; ")
		end
	end

	class Name
		def self.name
			"#{Random.firstname} #{Random.lastname}"
		end
	end

	class AddressAndPhone
		def self.generate
			fake  = fake_data.sample
			
			phone = [fake.phone_code, rand(10..99), rand(10..99), rand(10000..99999)].join("-")
			address = [Random.address_line_1, fake.city, fake.state, fake.zip_code, fake.country].join(", ")
			
			[address, phone].join('; ')
		end

		def self.fake_data
			@data ||= File.open( "./fixtures/US.txt" ).map {|r| FakeData.new(r)}
			#RU - YAML
			#BY - CSV
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
			@line[3]
		end

		def country
			"USA"
		end

		def zip_code
			@line[1]
		end

		def phone_code
			@line[6]
		end
	end
end
