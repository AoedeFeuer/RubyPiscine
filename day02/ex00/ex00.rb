#!/usr/bin/env ruby -w

class Html
    attr_reader :page_name

    def initialize(page_name)
        @page_name = page_name
        head
    end 

    def head()
        htmlFile = File.new("#{page_name}.html", "w")
        htmlFile.write <<-EOF
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>#{@page_name}</title>
    </head>

    <body>
        EOF
        htmlFile.close
    end

    def dump(str)
        htmlFile = File.open("#{page_name}.html", "a")
        htmlFile.write <<-EOF
        <p>#{str}</p>
        EOF
        htmlFile.close
    end

    def finish()
        htmlFile = File.open("#{page_name}.html", "a")
        htmlFile.write <<-EOF
    </body>
</html>
        EOF
        htmlFile.close
    end
end

if $PROGRAM_NAME == __FILE__
    a = Html.new("test")
    10.times{|x| a.dump("titi_number#{x}")}
    a.finish
end

# require_relative "ex00.rb"