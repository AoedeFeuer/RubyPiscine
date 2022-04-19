#!/usr/bin/env ruby -w

def my_read()

    file_data = File.read("numbers.txt").split.map{|a| a.to_i }.sort
    puts(file_data)

end

my_read()