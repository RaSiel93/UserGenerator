module UserGenerator
	 CITY_BY = {
	 		"Минск" => "223", 
	 		"Витебск" => "211", 
	 		"Могилев" => "213", 
	 		"Гомель" => "247", 
	 		"Брест" => "225", 
	 		"Гродно" => "231"
	 	}
	 PHONE_CODE_BY = %w"29 33 44"
	 
	 CITY_RU = {
	 		"Москва" => ["11","906"],
	 		"Санкт-Петербург" => ["11","906"],
	 		"Новосибирск" => ["12","906"], 
	 		"Екатеринбург" => ["11","906"], 
	 		"Казань" => ["13","906"],
	 		"Самара" => ["12","906"],
	 		"Омск" => ["15","906"], 
	 		"Челябинск" => ["14","906"], 
	 		"Новосибирск" => ["11","906"], 
	 		"Уфа" => ["15","906"], 
	 		"Волгоград" => ["12","906"], 
	 		"Красноярск" => ["13","906"], 	
	 		"Пермь" => ["11","906"], 
	 		"Воронеж" => ["12","906"],	
	 		"Лебедянь" => ["13","906"],  	
	 		"Кинель" => ["12","906"],  	
	 		"Верещагино" => ["12","906"],  	
	 		"Дагестанские Огни" => ["11","906"],  	
	 		"Строитель" => ["13","906"],  	
	 		"Новосиль" => ["14","906"],  	
	 		"Беднодемьяновск" => ["17","906"] 	
	 }
	 #@phone_code_ru = %w"901 902 903 904 905 906 908 909 910 911 912 913 914 915 917 918 919 920 921 922 923 924 925 926 927 928 929 930 931 932 933 934 937 938 950 951 952 953 960 961 962 963 964 965 967 980 981 982 983 984 987 988"

  def self.generate region
		user = generate_russian_user if region == "RU"
		user = generate_belarusian_user if region == "BY"
		user = generate_english_user if region == "EN"
		user
  end

  def self.generate_russian_user
  	name = Ryba::Name.full_name
		
		street = Ryba::Address.address
		city = CITY_RU.keys.sample
		index = CITY_RU[city][0]
		index += rand.to_s[2..5]
		country = "Россия" 
		
		phone = "+7-" + CITY_RU[city][1] + "-" +rand.to_s[2..4] + "-" + rand.to_s[2..5] 

		address = [street + "г. " + city, index, country].join(", ")

		[name, address, phone].join("; ")
  end
	
	def self.generate_belarusian_user
		name = Ryba::Name.full_name
		
		street = Ryba::Address.address
		city = CITY_BY.keys.sample
		index = CITY_BY[city] + rand.to_s[2..4]
		country = "Беларусь" 
		
		phone = "+375-" + PHONE_CODE_BY.sample + "-" +rand.to_s[2..4] + "-" + rand.to_s[2..5] 

		address = [street, "г. " + city, index, country].join(", ")

		[name, address, phone].join("; ")
  end
  
  def self.generate_english_user
		Random.firstname + " " + Random.lastname + "; " + Random.address_line_1 + ", " + Random.address_line_2 + ", " + Random.state_full + ", " + Random.city + ", " + Random.zipcode + ", USA; " + Random.international_phone
  end
end