#!/usr/bin/env ruby -w

class String
    def my_titleize
      split.map(&:capitalize).join(' ')
    end
end

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
        array_args = ARGV[0].split(",").map{|a| a.to_s.strip.my_titleize }
    end

    array_args.each do |arg|
        if !arg.empty? || arg.nil?
            if (city_code = capitals_cities.key(arg))
                puts ("#{arg} is the capital of #{states.key(city_code)} (akr: #{city_code})")
            elsif (city_code = states[arg])
                puts ("#{capitals_cities[city_code]} is the capital of #{arg} (akr: #{city_code})")
            else
                puts("#{arg} is neither a capital city nor a state")
            end
        end
    end

end

my_search()

=begin

Checker:

"Salem , ,Alabama, Toto , ,MontGOmery, New Jersey, Trenton"
"Salem , ,Alabama, Toto , ,MontGOmery"
"Salem , ,Alabama, Toto , ,MontGOmery, ,,, Canada"
"Salem , ,Alabama, Toto , ,NJ, ,,, Canada"
"SaLeM aLabAMA , ,Alabama, Toto , ,NJ, ,,, Canada"

=end