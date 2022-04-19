#!/usr/bin/env ruby -w

def my_var()
	a = 10
	b = "10"
	c = nil
	d = 10.0

	puts "my variables :"
	print "	a contains: #{a} and is a type: " 
	puts a.class
	print "	b contains: #{b} and is a type: "
	puts b.class
	print "	c contains: #{c.inspect} and is a type: "
	puts c.class
	print "	d contains: #{d} and is a type: "
	puts d.class
end

my_var()

#my variables :
#	a contains: 10 and is a type: Fixnum
#	b contains: 10 and is a type: String
#	c contains: nil and is a type: NilClass
#	d contains: 10.0 and is a type: Float