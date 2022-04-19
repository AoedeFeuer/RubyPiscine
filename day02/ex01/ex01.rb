#!/usr/bin/env ruby -w

class Html
    attr_reader :page_name

    def initialize(page_name)
        @page_name = page_name
        head
    end 

    def head()
        if File.exist? "#{@page_name}.html"
            raise RuntimeError, "A file named #{@page_name}.html already exist!"
        end
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
        if !File.foreach("#{page_name}.html").any? { |l| l['<body>'] }
            raise RuntimeError, "There is no body tag in #{page_name}.html"
        end
        if File.foreach("#{page_name}.html").any? { |l| l['</body>'] }
            raise RuntimeError, "Body has already been closed in #{page_name}.html"
        end
        htmlFile = File.open("#{page_name}.html", "a")
        htmlFile.write <<-EOF
        <p>#{str}</p>
        EOF
        htmlFile.close
    end

    def finish()
        if File.foreach("#{page_name}.html").any? { |l| l['</body>'] }
            raise RuntimeError, "#{page_name}.html has already been closed."
        end
        htmlFile = File.open("#{page_name}.html", "a+")
        htmlFile.write <<-EOF
    </body>
</html>
        EOF
        htmlFile.close
    end
end


if $PROGRAM_NAME == __FILE__
    a = Html.new("test")
    a = Html.new("test")
    a.dump("Lorem_ipsum")
    a.finish
    a.finish
end

#  require_relative "ex01.rb"