#!/usr/bin/env ruby -w

def my_search()

    states = {
        "Oregon" => "OR",
        "Alabama" => "AL",
        "New Jersey" => "NJ",
        "Colorado" => "CO"
    }

    capitals_cities = {
        "OR" => "Salem",
        "AL" => "Montgomery",
        "NJ" => "Trenton",
        "CO" => "Denver"
    }
    
    if (ARGV.length != 1)
        exit 0
    else
        city_capital = states.key(capitals_cities.key(ARGV[0]))
    end
    
    if city_capital.nil?
        puts "Unknown capital city"
    else
        puts(city_capital)
    end

end

my_search()