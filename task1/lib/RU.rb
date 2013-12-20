require "./lib/Base"
require "random_data"
require 'yaml'
require 'pry'
require 'ostruct'
require "ryba"

module RU
	class Generator < Base::Generator
		def self.generate
			name = RU::Name.name
			address = RU::AddressAndPhone.generate
			
			[name, address].join("; ")
		end
	end

	class Name
		def self.name
			Ryba::Name.full_name
		end
	end

	class AddressAndPhone
		def self.generate
			fake  = OpenStruct.new(fake_data.sample)

			phone = [fake.phone_code, rand(10..99), rand(10..99), rand(10000..99999)].join("-")
			address = [Ryba::Address.street, fake.city, fake.state, fake.zip_code, "Россия"].join(", ")
			
			[address, phone].join('; ')
		end

		def self.fake_data
			@data ||= open('./fixtures/RU.cfg') { |f| YAML.load(f) }
		end
	end
end
