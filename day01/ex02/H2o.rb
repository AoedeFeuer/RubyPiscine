#!/usr/bin/env ruby -w

def my_hash()

    data = [['Caleb' , 24],
    ['Calixte' , 84],
    ['Calliste', 65],
    ['Calvin' , 12],
    ['Cameron' , 54],
    ['Camil' , 32],
    ['Camille' , 5],
    ['Can' , 52],
    ['Caner' , 56],
    ['Cantin' , 4],
    ['Carl' , 1],
    ['Carlito' , 23],
    ['Carlo' , 19],
    ['Carlos' , 26],
    ['Carter' , 54],
    ['Casey' , 2]]

    my_hash = Hash[data.to_h.map{|name,nb| [nb,name] } ]

    my_hash.each do |key, value|
        puts "#{key} : #{value}"
    end

end

my_hash()

#add this to check classes (hash[fixnum:str])
#puts "#{key.class} : #{value.class}"
#puts "#{my_hash.class}"