require "./lib/Options"
require "./lib/Generator"

options = Options.new(ARGV)

if options.errors?
	options.errors.each { |e| puts e }
	exit(0)
end

p Generator.generate options