#!/usr/bin/env ruby -w

class Dup_file < StandardError
    attr_reader :page_name

    def initialize(page_name)
        @page_name = page_name
    end

    def show_state()
        path_file = File.expand_path("#{page_name}.html")
        puts "A file named #{page_name}.html was already there: #{path_file}"
    end

    def correct()
        @add_file = "#{page_name}.new"
        begin
            if File.exist? "#{@add_file}.html"
                raise e = Dup_file.new(@add_file)
            end
        rescue => e
                @add_file = e.correct
        end
        File.open("#{@add_file}.html", "w+")
        @add_file
    end

    def explain()
        path_file_e = File.expand_path("#{@add_file}.html")
        puts "Appended .new in order to create requested file: #{path_file_e}"
    end
end

class Body_closed < StandardError
    attr_reader :page_name
    
    def initialize(page_name, str)
        @page_name = page_name
        @str = str
    end

    def show_state()
        puts "In #{page_name}.html body was closed :"
    end

    def correct()
        tempfile = []    
        File.foreach("#{page_name}.html") do |l| 
            if l.include? "</body>"
                tempfile << "        <p>#{@str}</p>\n"
                @line = "#{$.}"
            end
            tempfile << l
        end
        File.open("#{@page_name}.html", "w") do |file|
		 	tempfile.each {|line| file << line }
		end
    end

    def explain()
        puts " ln #{@line} </body> : text has been inserted and tag moved at the end of it."
    end
end

class Html
    attr_reader :page_name

    def initialize(page_name)
        @page_name = page_name
        head
    end 

    def head()
        if File.exist? "#{@page_name}.html"
            begin
                raise ex = Dup_file.new(@page_name)
            rescue => ex
                ex.show_state
                @page_name = ex.correct
                ex.explain
            end
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
            raise "There is no body tag in #{page_name}.html"
        end
        if File.foreach("#{page_name}.html").any? { |l| l['</body>'] }
            begin
                raise ex = Body_closed.new(@page_name, str)
            rescue => ex
                ex.show_state
                ex.correct
                ex.explain
            end
        else
            htmlFile = File.open("#{page_name}.html", "a")
            htmlFile.write <<-EOF
        <p>#{str}</p>
            EOF
            htmlFile.close
        end
    end

    def finish()
        if File.foreach("#{page_name}.html").any? { |l| l['</body>'] }
            raise "#{page_name}.html has already been closed."
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
    a.dump("Lorem_ipsum")
end

#  require_relative "ex02.rb"