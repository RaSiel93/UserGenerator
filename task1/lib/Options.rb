class Options
	attr_reader :location, :count, :probability

	def errors?
		@errors.any?
	end

	def errors
		@errors
	end

	private

	def initialize(args)
		@errors = []

		OptionParser.new do |opts|
	  	opts.banner = "Usage: user_generator.rb [options]"

	 		opts.on("-l", "--location [:RU, :BY, :US]", "Location of generated users") do |loc|
				@errors << "Wrong location of watermark. Aborted!" if loc.match("^BY$|^RU$|^EN$").nil?
	    	@location = loc
	  	end 

	  	opts.on("-c", "--count NUMBER", "Count of records") do |c|
	  		@errors << "Is not number. Aborted! #{c}" if c.to_i.to_s != c
	    	@count = c.to_i
	  	end

	  	opts.on("-p", "--probability FLOAT_NUMBER", "Probability error in record") do |p|
	    	@errors << "Is not number. Aborted! #{p}" if p.to_f.to_s != p
	    	@errors << "Beyond the allowed values (0..1). #{p}" if p.to_f < 0 || p.to_f > 1
	    	@probability = p.to_f
	  	end
		end.parse!
	end
end