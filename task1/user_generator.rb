require "ryba"
require "random_data"
require 'optparse'

require "./lib/Damage"
require "./lib/UserGenerator"


class OptParser

	def self.parse(args)
		options = {}
		OptionParser.new do |opts|
	  	opts.banner = "Usage: user_generator.rb [options]"

	 		opts.on("-l", "--location [:RU, :BY, :US]", "Location of generated users") do |loc|
	    	
	    	options[:location] = loc
	  	end 

	  	opts.on("-c", "--count NUMBER", "Count of records") do |c|
	    	options[:count] = c.to_i
	  	end


	  	opts.on("-p", "--probability FLOAT_NUMBER", "Probability error in record") do |p|
	    	options[:probability] = p.to_f
	  	end
		end.parse!

		errors = []
		errors << "Not all options getted!" if (options).count != 3
		errors << "Wrong location of watermark. Aborted!" if options[:location].match("^BY$|^RU$|^EN$").nil?
		errors << "Is not numberа. Aborted! #{options[:count]}" if options[:count].to_s != options[:count]
		# errors << "Unsupported format of watermark! Aborted!" if options[:mark_img].split('.')[-1].match("^gif$|^jpg$|^png$").nil?
		# errors << "Empty work directory. Aborted!" if !Dir.new(options[:work_directory]).any?

		if errors.any?
		  errors.each { |e| puts e }
		  exit(0)
		end

		options
	end
end

module Generator

  def self.generate options
  	users = []
  	while users.size != options[:count] do
	  	user = UserGenerator::generate options[:location]
	  	users += [Damage::execute(user, options[:probability])]
  		users.uniq!
  	end
  	users
  end

  # def self.check args
  # 	return false if args.size != 3
  # 	return false if args[0].size != 2 || !args[0].match(/(BY)|(RU)|(EN)/)
  # 	return false if args[1] != args[1].to_i.to_s || args[1].to_i < 0
  # 	return false if args[2] != args[2].to_f.to_s || args[2].to_f > 1 || args[2].to_f < 0
  # 	true
  # end
end


options = OptParser.parse(ARGV)

p Generator::generate options