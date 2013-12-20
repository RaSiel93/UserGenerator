require "./lib/Base"
require "random_data"
require 'pry'
require 'ostruct'
require "ryba"
require 'csv'

module BY
	PHONE_CODE_BY = %w"29 33 44"

	class Generator < Base::Generator
		def self.generate
			name = BY::Name.name
			address = BY::AddressAndPhone.generate
			
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

			phone = ["+375-#{PHONE_CODE_BY.sample}", rand(100..999), rand(10..99), rand(10..99)].join("-")
			address = [Ryba::Address.street, fake.city, fake.state, fake.zip_code, "Беларусь"].join(", ")
			
			[address, phone].join('; ')
		end

		def self.fake_data
			if @data.nil?  
				@data = []
				CSV.foreach("./fixtures/BY.csv") do |row|
	  			@data += [
	  				{
	  					"city" => "г. #{row[0]}",
							"state" => row[2],
							"zip_code" => row[1]
	  				}
	  			]
				end
  		end
  		@data
		end
	end
end
