require "./lib/Options"
require "./lib/Generator"
require 'set'

options = Options.new(ARGV)

if options.errors?
	options.errors.each { |e| puts e }
	exit(0)
end

p Generator.generate options