#!/usr/bin/env ruby -w

def my_search()

    data = [
        ['Frank', 33],
        ['Stacy', 15],
        ['Juan' , 24],
        ['Dom' , 32],
        ['Steve', 24],
        ['Jill' , 24]
    ]
    
    data = data.sort_by { |name, age| [age, name] }
    data.each { |name, age| puts name }

end

my_search()